open Core

(* Treat this like println!("{}", s) *)
let println s =
  Printf.printf "%s\n" s;
  Out_channel.flush Out_channel.stdout

let secret = "Password1"

let rec main (guesses : int) =
  match In_channel.input_line In_channel.stdin with
  | Some line ->
    if line = secret then
      println ("You guessed it!")
    else
      (println (Printf.sprintf "Guesses: %d" (guesses + 1));
       main (guesses + 1))
  | None -> ()

let () = main 0
