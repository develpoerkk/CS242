open Core

module Type : sig
  type t =
    | Int
    | Fn of t * t
  [@@deriving sexp_of, sexp, compare]

  val to_string : t -> string
end

module Term : sig
  type binop = Add | Sub | Mul | Div
  [@@deriving sexp_of, sexp, compare]

  type t =
    | Var of string
    | Int of int
    | Binop of binop * t * t
    | Lam of string * Type.t * t
    | App of t * t
  [@@deriving sexp_of, sexp, compare]

  val to_string : t -> string

  val substitute : string -> t -> t -> t
end
