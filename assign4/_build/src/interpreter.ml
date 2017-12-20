open Core
open Ast.IR

exception RuntimeError of string
exception Unimplemented

type outcome =
  | Step of Term.t
  | Val
  | Err of string

(* You will implement the cases below. See the dynamics section
   for a specification on how the small step semantics should work. *)
let rec trystep (t : Term.t) : outcome =
  match t with
  | Term.Var _ -> raise (RuntimeError "Unreachable")

  | (Term.Lam _ | Term.Int _) -> Val

  | Term.TLam (_, t) -> Step t

  | Term.TApp (t, _) -> Step t

  | Term.TPack (_, t, _) -> Step t

  | Term.TUnpack (_, x, t1, t2) -> Step (Term.substitute x t1 t2)

  | Term.App (fn, arg) -> (
        match (trystep fn) with
          | Val -> (
              match (trystep arg) with
              | Val -> (
                  match fn with
                  | Term.Lam (x', tau, body) -> Step (Term.substitute x' arg body)
                  | _ -> Err ("error")
                )
              | Step next_arg -> Step (Term.App (fn, next_arg))
              | Err s -> Err s
            )
          | Step next_fn -> Step (Term.App (next_fn, arg))
          | Err s -> Err s
    )

  | Term.Binop (b, t1, t2) -> (
      match trystep t1 with
      | Val -> (
          match trystep t2 with
          | Val -> (
              let l = (
                match t1 with 
                | Term.Int ll -> ll
                | _ -> raise (RuntimeError "error")
              ) in
              let r = (
                match t2 with 
                | Term.Int rr -> rr
                | _ -> raise (RuntimeError "error")
              ) in
              match b with
              | Add -> Step (Term.Int (l + r))
              | Sub -> Step (Term.Int (l - r))
              | Mul -> Step (Term.Int (l * r))
              | Div -> (
                  match r with
                  | 0 -> Err "Div by Zero"
                  | _ -> Step (Term.Int (l / r))
                )
              | _ -> Err "error"
            )
          | Step next_t2 -> Step (Term.Binop (b, t1, next_t2))
          | Err s -> Err s
        )
      | Step next_t1 -> Step (Term.Binop (b, next_t1, t2))
      | Err s -> Err s
    )

    
  | Term.Tuple (t1, t2) -> (
      match trystep t1 with 
      | Val -> (
          match trystep t2 with 
          | Val -> Val
          | Step next_t2 -> Step (Term.Tuple (t1, next_t2))
          | Err s -> Err s
        )
      | Step next_t1 -> Step (Term.Tuple (next_t1, t2))
      | Err s -> Err s
    )

  | Term.Project (t, dir) -> (
     match trystep t with 
       | Val -> (
           match t with 
           | Term.Tuple (tl, tr) -> (
               match dir with
               | Left -> Step tl
               | Right -> Step tr
               | _ -> Err "error"
             )
         )
       | Step next_t -> Step (Term.Project (next_t, dir))
       | Err s -> Err s
    )


  | Term.Inject (t, dir, tau) -> (
      match trystep t with
      | Val -> Val
      | Step next_t -> Step (Term.Inject (next_t, dir, tau))
      | Err s -> Err s
    )


  | Term.Case (t, (x1, t1), (x2, t2)) -> (
      match trystep t with
      | Val -> (
          match t with
          | Term.Inject (next_t, dir, tau) -> (
              match dir with
              | Left -> Step (Term.substitute x1 next_t t1)
              | Right -> Step (Term.substitute x2 next_t t2)
              | _ -> Err "error"
            )
        )
      | Step next_t -> Step (Term.Case (next_t, (x1, t1), (x2, t2)))
      | Err s -> Err s
    )

let rec eval e =
  match trystep e with
  | Step e' -> eval e'
  | Val -> Ok e
  | Err s -> Error s

let inline_tests () =
  (* Typecheck Inject *)
  let inj =
    Term.Inject(Term.Int 5, Ast.Left, Type.Sum(Type.Int, Type.Int))
  in
  assert (trystep inj = Val);

  (* Typechecks Tuple *)
  let tuple =
    Term.Tuple(((Int 3), (Int 4)))
  in
  assert (trystep tuple = Val);

  (* Typechecks Case *)
  let inj =
    Term.Inject(Term.Int 5, Ast.Left, Type.Sum(Type.Int, Type.Product(Type.Int, Type.Int)))
  in
  let case1 = ("case1", Term.Int 8)
  in
  let case2 = ("case2", Term.Int 0)
  in
  let switch = Term.Case(inj, case1, case2)
  in
  assert (trystep switch = Step(Term.Int 8));

  (* Inline Tests from Assignment 3 *)
  let t1 = Term.Binop(Ast.Add, Term.Int 2, Term.Int 3) in
  assert (trystep t1 = Step(Term.Int 5));

  let t2 = Term.App(Term.Lam("x", Type.Int, Term.Var "x"), Term.Int 3) in
  assert (trystep t2 = Step(Term.Int 3));

  let t3 = Term.Binop(Ast.Div, Term.Int 3, Term.Int 0) in
  assert (match trystep t3 with Err _ -> true | _ -> false)

(* let () = inline_tests () *)
