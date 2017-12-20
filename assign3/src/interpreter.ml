open Core
open Ast

type outcome =
  | Step of Term.t
  | Val
  | Err of string

exception RuntimeError of string
exception Unimplemented

(* You will implement the App and Binop cases below. See the dynamics section
   for a specification on how the small step semantics should work. *)
let rec trystep t =
  match t with
  | Term.Var _ -> raise (RuntimeError "Unreachable")
  | (Term.Lam _ | Term.Int _) -> Val
  | Term.App (fn, arg) ->
    (
      match (trystep fn) with
      | Val -> (
          match (trystep arg) with
          | Val -> (
              match fn with
              | Term.Lam (x, arg_tau, body) -> Step (Term.substitute x arg body)
              | _ -> Err ("Lambda error")
            )
          | Step next_arg -> Step (Term.App (fn, next_arg))
          | Err s -> Err ("arg error")
        )
      | Step next_fn -> Step (Term.App (next_fn, arg))
      | Err s -> Err ("fn error")
    )
  | Term.Binop (binop, left, right) -> 
    (
        match (trystep left) with
          | Val -> (
              match (trystep right) with
              | Val -> (
                  let l = match left with
                    | Term.Int x -> x
                    | _ -> raise (RuntimeError "left val error")
                  in
                  let r = match right with
                    | Term.Int y -> y
                    | _ -> raise (RuntimeError "left val error")
                  in
                  match binop with
                  | Term.Add -> Step (Term.Int (l + r))
                  | Term.Sub -> Step (Term.Int (l - r))
                  | Term.Mul -> Step (Term.Int (l * r))
                  | Term.Div -> (
                      match r with
                      | 0 -> Err ("div by 0")
                      | _ -> Step (Term.Int (l / r))
                    )
                  | _ -> Err ("No such binop")
                )
              | Step next_right -> Step (Binop (binop, left, next_right))
              | Err s -> Err ("right error")
            )
          | Step next_left -> Step (Binop (binop, next_left, right))
          | Err s -> Err ("left error")
    )

let rec eval e =
  match trystep e with
  | Step e' -> eval e'
  | Val -> Ok e
  | Err s -> Error s

let inline_tests () =
  let t1 = Term.Binop(Term.Add, Term.Int 2, Term.Int 3) in
  assert (trystep t1 = Step(Term.Int 5));

  let t2 = Term.App(Term.Lam("x", Type.Int, Term.Var "x"), Term.Int 3) in
  assert (trystep t2 = Step(Term.Int 3));

  let t3 = Term.Binop(Term.Div, Term.Int 3, Term.Int 0) in
  assert (match trystep t3 with Err _ -> true | _ -> false)

(* Uncomment the line below when you want to run the inline tests. *)
let () = inline_tests ()
