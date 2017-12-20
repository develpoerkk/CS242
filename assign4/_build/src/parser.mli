
(* The type of tokens. *)

type token = 
  | WILDCARD
  | VAR of (string)
  | TY_INT
  | TFN
  | SUB
  | STAR
  | RPAREN
  | RIGHT
  | RBRACKET
  | RBRACE
  | PLUS
  | MUL
  | MATCH
  | LPAREN
  | LET
  | LEFT
  | LBRACKET
  | LBRACE
  | INT of (int)
  | INJECT
  | IN
  | FORALL
  | FN
  | EXISTS
  | EQUAL
  | EOF
  | DOT
  | DIV
  | COMMA
  | COLON
  | BAR
  | AS
  | ARROW

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.Lang.Term.t)
