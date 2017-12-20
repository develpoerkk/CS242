open Core

exception Unimplemented

module Type = struct
  type t =
    | Int
    | Fn of t * t
  [@@deriving sexp_of, sexp, compare]

  let to_string ty = Sexp.to_string_hum (sexp_of_t ty)
end

module Term = struct
  type binop = Add | Sub | Mul | Div
  [@@deriving sexp_of, sexp, compare]

  type t =
    | Var of string
    | Int of int
    | Binop of binop * t * t
    | Lam of string * Type.t * t
    | App of t * t
  [@@deriving sexp_of, sexp, compare]


  (* substitute has the following mapping to the logic discussed in lecture:
   * substitute x t' t = [x -> t'] t
   *
   * You will need to implement substitution by defining a case for each
   * possible form of a term. For each line, delete the raise and add your
   * implementation. *)
  let rec substitute x t' t =
    match t with
    | Int n -> Int n
    | Var x' -> if x = x' then t' else Var x'
    | Binop (b, t1, t2) -> Binop (b, (substitute x t' t1), (substitute x t' t2))
    | Lam (x', tau, body) -> if x <> x' then Lam (x', tau, (substitute x t' body)) else Lam (x', tau, body)
    | App (t1, t2) -> App ((substitute x t' t1), (substitute x t' t2))

  let inline_tests () =
    let t1 = App(Lam("x", Type.Int, Var "x"), Var "y") in
    assert (substitute "x" (Int 0) t1 = t1);
    assert (substitute "y" (Int 0) t1 =
            App(Lam("x", Type.Int, Var "x"), Int 0));

    let t2 = Binop(Add, Var "x", Lam("x", Type.Int, Var "y")) in
    assert (substitute "x" (Int 0) t2 =
            Binop(Add, Int 0, Lam("x", Type.Int, Var "y")));
    assert (substitute "y" (Int 0) t2 =
            Binop(Add, Var "x", Lam("x", Type.Int, Int 0)))

  let () = inline_tests ()


  let to_string e = Sexp.to_string_hum (sexp_of_t e)
end
