open Core
open Ast

(* Returns the type of the term, or an error if it fails to typecheck. *)
val typecheck : Term.t -> (Type.t, string) Result.t
