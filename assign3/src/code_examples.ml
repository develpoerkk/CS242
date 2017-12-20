open Core
open Result.Monad_infix
open Ast

(* Core offers a Printf module that functions similarly to C's printf,
 * but it's type safe! *)
let printf_examples () =
  (* Normal printf *)
  Printf.printf "Hello world\n";
  Printf.printf "A number: %d\n" 5;
  Printf.printf "A string: \"%s\"\n" "Hello world";

  (* Using sprintf to generate a string *)
  let s = Printf.sprintf "%d + %d" 1 2 in
  Printf.printf "A doubly-formatted string: %s\n" s;

  (* One question is--how can we print out a complex data structure like
   * an AST? We can manually define a Term.to_string and Type.to_string
   * that recurses over the data structure, but that would be laborious.
   * Instead, we use *s-expressions*, or Sexp. See Wikipedia for an
   * explanation: https://en.wikipedia.org/wiki/S-expression
   *
   * If you look at ast.ml, you can see [@@deriving sexp_of, sexp, compare].
   * This is an example of an OCaml syntax extension, e.g. a function that
   * generates OCaml code from other OCaml code. Here, if we annotate a type
   * like Term.t with [@@deriving sexp_of, sexp] then this auto-generates
   * a function which converts a Term.t into an s-expression, which is how
   * we define the Term.to_string and Type.to_string functions. *)
  let ty = Type.Fn (Type.Int, Type.Fn (Type.Int, Type.Int)) in
  let e = Term.Binop (Term.Add, Term.Int 5, Term.Int 3) in
  Printf.printf "%s\n" (Type.to_string ty);
  Printf.printf "%s\n" (Term.to_string e)


(* Inside the typechecker, you will need to use a *typing context*, or
 * a map that says which variables map to which types. We can use the module
 * String.Map that maps from strings to any kind of value. Here's an example. *)
let map_examples () =
  let map1 : Type.t String.Map.t = String.Map.empty in

  (* This is an example of a *functional update*. We don't actually change
   * the original map, but instead create a new map with the mapping
   * {x -> Int}. *)
  let map2 : Type.t String.Map.t =
    String.Map.add map1 ~key:"x" ~data:(Type.Int)
  in

  (* To access a key in the map, we use String.Map.find which returns an
   * option type that means: if the key exists, we return Some (value),
   * otherwise return None. *)
  let print_value (k : string) : unit =
    match String.Map.find map2 k with
    | None -> Printf.printf "String %s not in map\n" k
    | Some ty ->  Printf.printf "%s -> %s\n" k (Type.to_string ty)
  in

  print_value "x";
  print_value "y"


(* In your typechecker you'll deal frequently with the Result.t type.
 * Recall that Result.t is either Ok(the_type) or Error(the_error).
 * For example, in typing an expression like a + b, you'll typecheck a,
 * and *only if a typechecks* will you proceed to typecheck b. This is an
 * exceedingly common pattern with Result.t, where you only want to proceed
 * if the last computation succeeded. We can capture this idea with the
 * >>= operator. *)
let result_examples () =
  let try_div (n : int) (m : int) : (int, string) Result.t =
    if m = 0 then Error("div by 0")
    else Ok(n / m)
  in

  (* Let's say we wanted to express 10 / 5 / 2 / 0. One way to write
     this would be: *)
  let _ =
    match try_div 10 5 with
    | Ok n1 ->
      (match try_div n1 2 with
       | Ok n2 ->
         (match try_div n2 0 with
          | Ok n3 -> Ok n3
          | Error s -> Error s)
       | Error s -> Error s)
    | Error s -> Error s
  in

  (* But that's needlessly verbose. Here's an alternative version... *)
  let _ =
    try_div 10 5
    >>= fun n1 -> try_div n1 2
    >>= fun n2 -> try_div n2 0
  in

  (* The idea here is that we have an infix (i.e. goes between terms) operator
   * e1 >>= fun k -> e2 that says: if e1 succeeds (returns Ok(n)) then I call
   * the function after the arrow with k = n and return e2. This is an example
   * of a monad, but that's not super important--what matters is you
   * understand the problem being solved. *)

  ()


let main () =
  printf_examples ();
  map_examples ();
  result_examples ()

let () = main ()
