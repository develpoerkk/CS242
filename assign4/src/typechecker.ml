open Core
open Ast.IR

exception TypeError of string
exception Unimplemented

(* Checks that a type is legal. *)
let rec typecheck_type (tenv : String.Set.t) (tau : Type.t) : Type.t =
  match tau with
   | Type.Var x ->
     if Set.mem tenv x then tau
     else raise (TypeError (Printf.sprintf "Unbound type variable %s" x))
   | Type.Product (t1, t2) -> Type.Product (typecheck_type tenv t1, typecheck_type tenv t2)
   | Type.Sum (t1, t2) -> Type.Sum (typecheck_type tenv t1, typecheck_type tenv t2)
   | Type.Fn (t1, t2) -> Type.Fn (typecheck_type tenv t1, typecheck_type tenv t2)
   | Type.ForAll(s, t1) -> Type.ForAll(s, typecheck_type (String.Set.add tenv s) t1)
   | Type.Exists(s, t1) -> Type.Exists(s, typecheck_type (String.Set.add tenv s) t1)
   | Type.Int -> tau

(* You need to implement the statics for the remaining cases below.
 * We have provided you with implementations of the other cases that you may
 * refer to.
 *
 * Note that you'll have to use OCaml sets to do this assignment. The semantics
 * for sets will be similar to maps. Like Maps, Sets are also immutable, so
 * any result from a set function will be different from the source. You may
 * find the functions Set.add and Set.find to be useful, in addition to others.
 *)
let rec typecheck_term (tenv : String.Set.t) (env : Type.t String.Map.t) (t : Term.t) : Type.t =
  match t with
  | Term.Int _ -> Type.Int

  | Term.Var x -> (
      match (String.Map.find env x) with
      | Some _type -> (typecheck_type tenv _type) 
      | None -> raise (TypeError "Does not typecheck 01")
    )

  | Term.Lam (x, arg_tau, body) -> (
      let arg_tau_type = typecheck_type tenv arg_tau in
      let new_map = String.Map.add env ~key:x ~data:arg_tau_type in
      Type.Fn(arg_tau_type, typecheck_term tenv new_map body)
    )

  | Term.App (fn, arg) -> (
      let tau1 = typecheck_term tenv env fn in
      let tau2 = typecheck_term tenv env arg in
      match (tau1, tau2) with
      | (Type.Fn (type_a, type_b), type_c) -> (
          if Type.aequiv type_a type_c then type_b
          else raise (TypeError "Does not typecheck 03")
        )
      | _ -> raise (TypeError "Does not typecheck 05")
    )

  | Term.Binop (_, t1, t2) -> (
      let tau1 = typecheck_term tenv env t1 in
      let tau2 = typecheck_term tenv env t2 in
      match (tau1, tau2) with
      | (Type.Int, Type.Int) -> Type.Int
      | _ -> raise (TypeError "Does not typecheck 07")
    )

  | Term.Tuple (t1, t2) -> (
      let tau1 = typecheck_term tenv env t1 in
      let tau2 = typecheck_term tenv env t2 in
      typecheck_type tenv (Type.Product (tau1, tau2))
    )

  | Term.Project (t, dir) -> (
      let tau = typecheck_term tenv env t in
      match tau with
      | Type.Product (tau1, tau2) -> (
          match dir with
          | Left -> tau1
          | Right -> tau2
          | _ -> raise (TypeError "Does not typecheck 09")
        )
      | _ -> raise (TypeError "Does not typecheck 11")
    )

  | Term.Inject (arg, dir, sum_tau) -> (
      let tau = typecheck_term tenv env arg in
      let sum_tau_type = typecheck_type tenv sum_tau in
      match sum_tau_type with
      | Sum (tau1, tau2) -> (
          match dir with 
          | Left -> (
              if Type.aequiv tau tau1 then sum_tau_type
              else raise (TypeError "Does not typecheck 13")
            )
          | Right -> (
              if Type.aequiv tau tau2 then sum_tau_type
              else raise (TypeError "Does not typecheck 15")
            )
          | _ -> raise (TypeError "Does not typecheck 17")
        )
    )

  | Term.Case (switch, (x1, t1), (x2, t2)) -> (
      let switch_type = typecheck_term tenv env switch in
      match switch_type with
      | Type.Sum (type1, type2) -> (
          let t1_type = typecheck_term tenv (String.Map.add env ~key:x1 ~data:(typecheck_type tenv type1)) t1 in
          let t2_type = typecheck_term tenv (String.Map.add env ~key:x2 ~data:(typecheck_type tenv type2)) t2 in
          if Type.aequiv t1_type t2_type then t1_type
          else raise (TypeError "Does not typecheck 19")
        )
      | _ -> raise (TypeError "Does not typecheck 21")
    )

  | Term.TLam (x, t) -> (
        let new_tenv = String.Set.add tenv x in
        Type.ForAll (x, typecheck_term new_tenv env t)
    )

  | Term.TApp (t, arg_tau) -> (
        let t_type = typecheck_term tenv env t in
        match t_type with
        | Type.ForAll (x, t1_type) -> (
            let new_arg_tau = typecheck_type tenv arg_tau in
            let _type = Type.substitute x new_arg_tau t1_type in
            typecheck_type tenv _type
          )
        | _ -> raise (TypeError "Does not typecheck 23")
    )

  | Term.TPack (abstracted_tau, t, existential_type) -> (
      let e_type = typecheck_type tenv existential_type in
      match e_type with 
      | Type.Exists (x, tau2) -> (
          let type1 = typecheck_term tenv env t in
          let _type = Type.substitute x (typecheck_type tenv abstracted_tau) tau2 in 
          let type2 = typecheck_type tenv _type in
          if Type.aequiv type1 type2 then Type.Exists (x, tau2)
          else raise (TypeError "Does not typecheck 25")
        )
      | _ -> raise (TypeError "Does not typecheck 27")
    )

  | Term.TUnpack (xty, xterm, arg, body) -> (
      let arg_type = typecheck_term tenv env arg in
      match arg_type with
      | Type.Exists (x, tau1) -> (
          if xty = x then (
            let new_env = String.Map.add env ~key:xterm ~data:tau1 in
            typecheck_term (String.Set.add tenv xty) new_env body
          )
          else raise (TypeError "Does not typecheck 29")
        )
      | _ -> raise (TypeError "Does not typecheck 31")
    )

let typecheck t =
  try Ok (typecheck_term String.Set.empty String.Map.empty t)
  with TypeError s -> Error s

let inline_tests () =
  (* Typechecks Pack and Unpack*)
  let exist =
    Type.Exists("Y", Type.Int)
  in
  let pack =
    Term.TPack(Type.Int, Term.Int 5, exist)
  in
  let unpack =
    Term.TUnpack("Y", "y", pack, Term.Var "y")
  in
  assert(typecheck unpack = Ok(Type.Int));

  (* Typecheck Inject *)
  let inj =
    Term.Inject(Term.Int 5, Ast.Left, Type.Sum(Type.Int, Type.Int))
  in
  assert (typecheck inj = Ok(Type.Sum(Type.Int, Type.Int)));

  (* Typechecks Tuple *)
  let tuple =
    Term.Tuple(((Int 3), (Int 4)))
  in
  assert (typecheck tuple = Ok(Type.Product(Type.Int, Type.Int)));

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
  assert (typecheck switch = Ok(Type.Int));

  (* Inline Tests from Assignment 3 *)
  let t1 = Term.Lam ("x", Type.Int, Term.Var "x") in
  assert (typecheck t1 = Ok(Type.Fn(Type.Int, Type.Int)));

  let t2 = Term.Lam ("x", Type.Int, Term.Var "y") in
  assert (Result.is_error (typecheck t2));

  let t3 = Term.App (t1, Term.Int 3) in
  assert (typecheck t3 = Ok(Type.Int));

  let t4 = Term.App (t3, Term.Int 3) in
  assert (Result.is_error (typecheck t4));

  let t5 = Term.Binop (Ast.Add, Term.Int 0, t1) in
  assert (Result.is_error (typecheck t5))

let () = inline_tests ()
