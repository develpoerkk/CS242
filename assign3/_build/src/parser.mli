
(* The type of tokens. *)

type token = 
  | VAR of (string)
  | TY_INT
  | SUB
  | RPAREN
  | PLUS
  | MUL
  | LPAREN
  | INT of (int)
  | FN
  | EOF
  | DOT
  | DIV
  | COLON
  | ARROW

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.Term.t)
