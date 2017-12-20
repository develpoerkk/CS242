open Core
open Result.Monad_infix
open Ast

let parse input =
  let filebuf = Lexing.from_string input in
  try (Ok (Parser.main Lexer.token filebuf)) with
  | Lexer.Error msg -> Error msg
  | Parser.Error -> Error (
    Printf.sprintf "Parse Error: %d" (Lexing.lexeme_start filebuf))

let interpret expr =
  Printf.printf "Term: %s\n" (Term.to_string expr);
  Typecheck.typecheck expr >>= fun ty ->
  Printf.printf "Type: %s\n" (Type.to_string ty);
  Interpreter.eval expr

let run filename =
  let input = In_channel.read_all filename in
  let result = parse input >>= interpret in
  match result with
  | Ok e -> Printf.printf "Success: %s\n" (Term.to_string e)
  | Error s -> Printf.printf "Error: %s\n" s

(* TODO: need to reconcile src and solution differences *)
let main () =
  let open Command.Let_syntax in
  Command.basic'
    ~summary:"Lam1 interpreter"
    [%map_open
      let filename = anon ("filename" %: string) in
      fun () -> run filename
    ]
  |> Command.run

let () = main ()
