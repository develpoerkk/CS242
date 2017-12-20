open Core
open Result.Monad_infix
open Ast

exception Unimplemented

(* You need to implement the statics for the three remaining cases below,
 * Var, Lam, and App. We have provided you with an implementation for Int
 * and Binop that you may refer to. See code_examples.ml for more info
 * on the >>= operator. *)
let rec typecheck_term (env : Type.t String.Map.t) (t : Term.t) : (Type.t, string) Result.t =
  match t with
  | Term.Int _ -> Ok Type.Int
  | Term.Binop (_, t1, t2) ->
    typecheck_term env t1
    >>= fun tau1 ->
    typecheck_term env t2
    >>= fun tau2 ->
    (match (tau1, tau2) with
     | (Type.Int, Type.Int) -> Ok Type.Int
     | _ -> Error ("One of the binop operands is not an int"))
  | Term.Var x -> 
    (match String.Map.find env x with
    | None -> Error ("Variable does not exist")
    | Some _type -> Ok _type)
  | Term.Lam(x, arg_tau, t') -> 
    (
      let new_env: Type.t String.Map.t = String.Map.add env ~key:x ~data:arg_tau in
      typecheck_term new_env t'
      >>= fun n ->
      (
        match n with
        | Type.Fn (_type_1, _type_2) -> Ok (Type.Fn (arg_tau, Type.Fn(_type_1, _type_2)))
        | Type.Int -> Ok (Type.Fn (arg_tau, Type.Int))
        | _ -> Error("Lambda error")
      )
    )
  | Term.App (fn, arg) -> 
    (
      typecheck_term env arg
      >>= fun _type_arg ->
      typecheck_term env fn
      >>= fun n ->
      (
        match n with
        | Type.Fn (_type_1, _type_2) -> if _type_1 = _type_arg then Ok (_type_2) else Error("Application Error")
        | _ -> Error("Application error")
      )
    )

let typecheck t = typecheck_term String.Map.empty t

let inline_tests () =
  let t1 = Term.Lam ("x", Type.Int, Term.Var "x") in
  assert (typecheck t1 = Ok(Type.Fn(Type.Int, Type.Int)));

  let t2 = Term.Lam ("x", Type.Int, Term.Var "y") in
  assert (Result.is_error (typecheck t2));

  let t3 = Term.App (t1, Term.Int 3) in
  assert (typecheck t3 = Ok(Type.Int));

  let t4 = Term.App (t3, Term.Int 3) in
  assert (Result.is_error (typecheck t4));

  let t5 = Term.Binop (Term.Add, Term.Int 0, t1) in
  assert (Result.is_error (typecheck t5))

(* Uncomment the line below when you want to run the inline tests. *)
let () = inline_tests ()
