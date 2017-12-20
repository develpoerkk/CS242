open Core
open Ast

type outcome =
  | Step of Term.t
  | Val
  | Err of string

(* Attempts to execute a small step in the term. *)
val trystep : Term.t -> outcome

(* Reduces a term to a value, or an error if one occurs. *)
val eval : Term.t -> (Term.t, string) Result.t
