
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | WILDCARD
    | VAR of (
# 6 "src/parser.mly"
       (string)
# 12 "src/parser.ml"
  )
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
    | INT of (
# 36 "src/parser.mly"
       (int)
# 33 "src/parser.ml"
  )
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
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState107
  | MenhirState106
  | MenhirState103
  | MenhirState102
  | MenhirState100
  | MenhirState99
  | MenhirState96
  | MenhirState94
  | MenhirState93
  | MenhirState92
  | MenhirState90
  | MenhirState89
  | MenhirState87
  | MenhirState86
  | MenhirState85
  | MenhirState84
  | MenhirState82
  | MenhirState80
  | MenhirState78
  | MenhirState73
  | MenhirState72
  | MenhirState71
  | MenhirState70
  | MenhirState67
  | MenhirState66
  | MenhirState65
  | MenhirState64
  | MenhirState63
  | MenhirState62
  | MenhirState61
  | MenhirState60
  | MenhirState59
  | MenhirState56
  | MenhirState52
  | MenhirState50
  | MenhirState48
  | MenhirState47
  | MenhirState44
  | MenhirState39
  | MenhirState31
  | MenhirState25
  | MenhirState23
  | MenhirState21
  | MenhirState19
  | MenhirState16
  | MenhirState13
  | MenhirState10
  | MenhirState7
  | MenhirState6
  | MenhirState5
  | MenhirState4
  | MenhirState0

# 1 "src/parser.mly"
  
  open Ast.Lang
  exception Unimplemented

# 123 "src/parser.ml"

let rec _menhir_run42 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.Lang.Pattern.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | EXISTS ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | FORALL ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | TY_INT ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | VAR _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run21 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.Lang.Type.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXISTS ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | FORALL ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | TY_INT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | VAR _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21

and _menhir_run23 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.Lang.Type.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXISTS ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | FORALL ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | TY_INT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | VAR _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_run25 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.Lang.Type.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXISTS ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | FORALL ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | TY_INT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | VAR _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_run10 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 6 "src/parser.mly"
       (string)
# 231 "src/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXISTS ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | FORALL ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | TY_INT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | VAR _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10

and _menhir_goto_pat : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.Lang.Pattern.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState96 | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LBRACE ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | LPAREN ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | VAR _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
            | WILDCARD ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (p : (Ast.Lang.Pattern.t))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.Lang.Pattern.t) = 
# 86 "src/parser.mly"
                        ( p )
# 290 "src/parser.ml"
             in
            _menhir_goto_pat _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (p1 : (Ast.Lang.Pattern.t))), _, (p2 : (Ast.Lang.Pattern.t))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.Lang.Pattern.t) = 
# 84 "src/parser.mly"
                                         ( Pattern.Tuple(p1, p2) )
# 317 "src/parser.ml"
             in
            _menhir_goto_pat _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | EQUAL ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | FN ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | INJECT ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | INT _v ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
            | LBRACE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | LET ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | LPAREN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | MATCH ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | TFN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState47
            | VAR _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState103 | MenhirState94 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ARROW ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | FN ->
                    _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState99
                | INJECT ->
                    _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState99
                | INT _v ->
                    _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
                | LBRACE ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState99
                | LET ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState99
                | LPAREN ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState99
                | MATCH ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState99
                | TFN ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState99
                | VAR _v ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState99)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_run95 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 6 "src/parser.mly"
       (string)
# 428 "src/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COLON ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack)
    | ARROW | PLUS | RPAREN | STAR ->
        _menhir_reduce27 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run96 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXISTS ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState96
    | FORALL ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState96
    | LBRACE ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState96
    | LPAREN ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState96
    | TY_INT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState96
    | VAR _v ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
    | WILDCARD ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState96
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96

and _menhir_goto_dir : _menhir_env -> 'ttv_tail -> (Ast.direction) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AS ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EXISTS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | FORALL ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | TY_INT ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | VAR _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run61 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.Lang.Term.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | INJECT ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
    | LBRACE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | LPAREN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | MATCH ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | TFN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61

and _menhir_run63 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.Lang.Term.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | INJECT ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | LBRACE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | LPAREN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | MATCH ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | TFN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63

and _menhir_run65 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.Lang.Term.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | INJECT ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | LBRACE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | LPAREN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | MATCH ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | TFN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65

and _menhir_run67 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.Lang.Term.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXISTS ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | FORALL ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | TY_INT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | VAR _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67

and _menhir_run70 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.Lang.Term.t) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | INJECT ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | LBRACE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | LPAREN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | MATCH ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | TFN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70

and _menhir_reduce27 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 6 "src/parser.mly"
       (string)
# 644 "src/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (v : (
# 6 "src/parser.mly"
       (string)
# 650 "src/parser.ml"
    ))) = _menhir_stack in
    let _v : (Ast.Lang.Type.t) = 
# 71 "src/parser.mly"
          ( Type.Var(v) )
# 655 "src/parser.ml"
     in
    _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_ty : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.Lang.Type.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | AS | BAR | COMMA | DIV | EOF | EQUAL | FN | IN | INJECT | INT _ | LBRACE | LBRACKET | LET | LPAREN | MATCH | RBRACE | RBRACKET | RPAREN | SUB | TFN | VAR _ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (v : (
# 6 "src/parser.mly"
       (string)
# 679 "src/parser.ml"
            ))), _, (t : (Ast.Lang.Type.t))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.Lang.Type.t) = 
# 77 "src/parser.mly"
                            ( Type.Exists(v, t) )
# 686 "src/parser.ml"
             in
            _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | AS | BAR | COMMA | DIV | EOF | EQUAL | FN | IN | INJECT | INT _ | LBRACE | LBRACKET | LET | LPAREN | MATCH | RBRACE | RBRACKET | RPAREN | SUB | TFN | VAR _ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (t1 : (Ast.Lang.Type.t))), _, (t2 : (Ast.Lang.Type.t))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.Lang.Type.t) = 
# 73 "src/parser.mly"
                       ( Type.Product(t1, t2) )
# 713 "src/parser.ml"
             in
            _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | AS | BAR | COMMA | DIV | EOF | EQUAL | FN | IN | INJECT | INT _ | LBRACE | LBRACKET | LET | LPAREN | MATCH | PLUS | RBRACE | RBRACKET | RPAREN | SUB | TFN | VAR _ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (t1 : (Ast.Lang.Type.t))), _, (t2 : (Ast.Lang.Type.t))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.Lang.Type.t) = 
# 74 "src/parser.mly"
                       ( Type.Sum(t1, t2) )
# 738 "src/parser.ml"
             in
            _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | AS | BAR | COMMA | DIV | EOF | EQUAL | FN | IN | INJECT | INT _ | LBRACE | LBRACKET | LET | LPAREN | MATCH | PLUS | RBRACE | RBRACKET | RPAREN | SUB | TFN | VAR _ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (t1 : (Ast.Lang.Type.t))), _, (t2 : (Ast.Lang.Type.t))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.Lang.Type.t) = 
# 75 "src/parser.mly"
                        ( Type.Fn(t1, t2) )
# 763 "src/parser.ml"
             in
            _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | AS | BAR | COMMA | DIV | EOF | EQUAL | FN | IN | INJECT | INT _ | LBRACE | LBRACKET | LET | LPAREN | MATCH | RBRACE | RBRACKET | RPAREN | SUB | TFN | VAR _ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (v : (
# 6 "src/parser.mly"
       (string)
# 788 "src/parser.ml"
            ))), _, (t : (Ast.Lang.Type.t))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.Lang.Type.t) = 
# 76 "src/parser.mly"
                            ( Type.ForAll(v, t) )
# 795 "src/parser.ml"
             in
            _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState94 | MenhirState96 | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (t : (Ast.Lang.Type.t))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.Lang.Type.t) = 
# 78 "src/parser.mly"
                       ( t )
# 823 "src/parser.ml"
             in
            _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v
        | STAR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | AS | COMMA | EQUAL | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (v : (
# 6 "src/parser.mly"
       (string)
# 850 "src/parser.ml"
            ))), _, (t : (Ast.Lang.Type.t))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.Lang.Pattern.t) = 
# 82 "src/parser.mly"
                       ( Pattern.Var(v, t) )
# 856 "src/parser.ml"
             in
            _menhir_goto_pat _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | AS | COMMA | EQUAL | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (p : (Ast.Lang.Pattern.t))), (v : (
# 6 "src/parser.mly"
       (string)
# 881 "src/parser.ml"
            ))), _, (t : (Ast.Lang.Type.t))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (Ast.Lang.Pattern.t) = 
# 83 "src/parser.mly"
                                  ( Pattern.Alias(p, v, t) )
# 888 "src/parser.ml"
             in
            _menhir_goto_pat _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState93 | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | FN ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState50
            | INJECT ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState50
            | INT _v ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
            | LBRACE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState50
            | LET ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState50
            | LPAREN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState50
            | MATCH ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState50
            | TFN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState50
            | VAR _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50)
        | PLUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState56 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | DOT ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | FN ->
                    _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState59
                | INJECT ->
                    _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState59
                | INT _v ->
                    _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
                | LBRACE ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState59
                | LET ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState59
                | LPAREN ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState59
                | MATCH ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState59
                | TFN ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState59
                | VAR _v ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | STAR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | RBRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e : (Ast.Lang.Term.t))), _), _, (t : (Ast.Lang.Type.t))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (Ast.Lang.Term.t) = 
# 63 "src/parser.mly"
                                    ( Term.TApp(e, t) )
# 1015 "src/parser.ml"
             in
            _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
        | STAR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | BAR | COMMA | DIV | EOF | EQUAL | FN | IN | INJECT | INT _ | LBRACE | LBRACKET | LET | LPAREN | MATCH | RBRACE | RPAREN | SUB | TFN | VAR _ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((((_menhir_stack, _menhir_s), _, (e : (Ast.Lang.Term.t))), _), (d : (Ast.direction))), _, (t : (Ast.Lang.Type.t))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.Lang.Term.t) = 
# 59 "src/parser.mly"
                                          ( Term.Inject(e, d, t) )
# 1046 "src/parser.ml"
             in
            _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | BAR | COMMA | DIV | EOF | EQUAL | FN | IN | INJECT | INT _ | LBRACE | LBRACKET | LET | LPAREN | MATCH | RBRACE | RPAREN | SUB | TFN | VAR _ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((((_menhir_stack, _menhir_s), _, (t1 : (Ast.Lang.Type.t))), _, (e : (Ast.Lang.Term.t))), _), _, (t2 : (Ast.Lang.Type.t))) = _menhir_stack in
            let _6 = () in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.Lang.Term.t) = 
# 64 "src/parser.mly"
                                                  ( Term.TPack(t1, e, t2) )
# 1076 "src/parser.ml"
             in
            _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.Lang.Pattern.t) = 
# 81 "src/parser.mly"
           ( Pattern.Wildcard )
# 1096 "src/parser.ml"
     in
    _menhir_goto_pat _menhir_env _menhir_stack _menhir_s _v

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 6 "src/parser.mly"
       (string)
# 1103 "src/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COLON ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run31 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LBRACE ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | LPAREN ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | VAR _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | WILDCARD ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31

and _menhir_run32 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | VAR _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | RBRACE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (((_menhir_stack, _menhir_s), (v1 : (
# 6 "src/parser.mly"
       (string)
# 1168 "src/parser.ml"
                    ))), (v2 : (
# 6 "src/parser.mly"
       (string)
# 1172 "src/parser.ml"
                    ))) = _menhir_stack in
                    let _5 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : (Ast.Lang.Pattern.t) = 
# 85 "src/parser.mly"
                                        ( Pattern.TUnpack(v1, v2) )
# 1180 "src/parser.ml"
                     in
                    _menhir_goto_pat _menhir_env _menhir_stack _menhir_s _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_term : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.Lang.Term.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | FN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | INJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | LBRACE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | LBRACKET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | LPAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | MATCH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | PLUS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | STAR ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | SUB ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | TFN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | BAR | COMMA | EOF | EQUAL | IN | RBRACE | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), (v : (
# 6 "src/parser.mly"
       (string)
# 1250 "src/parser.ml"
            ))), _, (t : (Ast.Lang.Type.t))), _, (e : (Ast.Lang.Term.t))) = _menhir_stack in
            let _7 = () in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.Lang.Term.t) = 
# 56 "src/parser.mly"
                                                     ( Term.Lam(v, t, e) )
# 1260 "src/parser.ml"
             in
            _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60)
    | MenhirState61 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | FN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | INJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
        | LBRACE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | LBRACKET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | LPAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | MATCH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | STAR ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | TFN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
        | BAR | COMMA | EOF | EQUAL | IN | PLUS | RBRACE | RPAREN | SUB ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.Lang.Term.t))), _), _, (e2 : (Ast.Lang.Term.t))) = _menhir_stack in
            let _10 = () in
            let _v : (Ast.Lang.Term.t) = let b =
              let _1 = _10 in
              
# 94 "src/parser.mly"
      ( Ast.Sub )
# 1305 "src/parser.ml"
              
            in
            
# 55 "src/parser.mly"
                                ( Term.Binop(b, e1, e2) )
# 1311 "src/parser.ml"
             in
            _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62)
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | FN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | INJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v
        | LBRACE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | LBRACKET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | LPAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | MATCH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | PLUS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | STAR ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | SUB ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | TFN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v
        | BAR | COMMA | EOF | EQUAL | IN | RBRACE | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.Lang.Term.t))), _), _, (e2 : (Ast.Lang.Term.t))) = _menhir_stack in
            let _10 = () in
            let _v : (Ast.Lang.Term.t) = let b =
              let _1 = _10 in
              
# 95 "src/parser.mly"
       ( Ast.Mul )
# 1360 "src/parser.ml"
              
            in
            
# 55 "src/parser.mly"
                                ( Term.Binop(b, e1, e2) )
# 1366 "src/parser.ml"
             in
            _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64)
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | FN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | INJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | LBRACE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | LBRACKET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | LPAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | MATCH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | STAR ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | TFN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | BAR | COMMA | EOF | EQUAL | IN | PLUS | RBRACE | RPAREN | SUB ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.Lang.Term.t))), _), _, (e2 : (Ast.Lang.Term.t))) = _menhir_stack in
            let _10 = () in
            let _v : (Ast.Lang.Term.t) = let b =
              let _1 = _10 in
              
# 93 "src/parser.mly"
       ( Ast.Add )
# 1411 "src/parser.ml"
              
            in
            
# 55 "src/parser.mly"
                                ( Term.Binop(b, e1, e2) )
# 1417 "src/parser.ml"
             in
            _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66)
    | MenhirState70 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | FN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | INJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
        | LBRACE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | LBRACKET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | LPAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | MATCH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | STAR ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | TFN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
        | BAR | COMMA | DIV | EOF | EQUAL | IN | PLUS | RBRACE | RPAREN | SUB ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.Lang.Term.t))), _), _, (e2 : (Ast.Lang.Term.t))) = _menhir_stack in
            let _10 = () in
            let _v : (Ast.Lang.Term.t) = let b =
              let _1 = _10 in
              
# 96 "src/parser.mly"
      ( Ast.Div )
# 1460 "src/parser.ml"
              
            in
            
# 55 "src/parser.mly"
                                ( Term.Binop(b, e1, e2) )
# 1466 "src/parser.ml"
             in
            _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71)
    | MenhirState107 | MenhirState106 | MenhirState92 | MenhirState100 | MenhirState87 | MenhirState90 | MenhirState84 | MenhirState86 | MenhirState80 | MenhirState73 | MenhirState60 | MenhirState62 | MenhirState64 | MenhirState66 | MenhirState72 | MenhirState71 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | FN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | INJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
        | LBRACE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | LBRACKET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | LPAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | MATCH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | PLUS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | STAR ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | SUB ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | TFN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
        | BAR | COMMA | EOF | EQUAL | IN | RBRACE | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.Lang.Term.t))), _, (e2 : (Ast.Lang.Term.t))) = _menhir_stack in
            let _v : (Ast.Lang.Term.t) = 
# 57 "src/parser.mly"
                      ( Term.App(e1, e2) )
# 1512 "src/parser.ml"
             in
            _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72)
    | MenhirState52 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | EQUAL ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState73 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LEFT ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _menhir_stack = Obj.magic _menhir_stack in
                let _1 = () in
                let _v : (Ast.direction) = 
# 89 "src/parser.mly"
       (Ast.Left)
# 1541 "src/parser.ml"
                 in
                _menhir_goto_dir _menhir_env _menhir_stack _v
            | RIGHT ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _menhir_stack = Obj.magic _menhir_stack in
                let _1 = () in
                let _v : (Ast.direction) = 
# 90 "src/parser.mly"
        (Ast.Right)
# 1552 "src/parser.ml"
                 in
                _menhir_goto_dir _menhir_env _menhir_stack _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | FN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | INJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
        | LBRACE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | LBRACKET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | LPAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | MATCH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | PLUS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | STAR ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | SUB ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | TFN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73)
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | FN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | INJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
        | LBRACE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | LBRACKET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | LPAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | MATCH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | PLUS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | RBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState80 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | AS ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | EXISTS ->
                    _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState82
                | FORALL ->
                    _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState82
                | LPAREN ->
                    _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState82
                | TY_INT ->
                    _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState82
                | VAR _v ->
                    _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | STAR ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | SUB ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | TFN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80)
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | FN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState84 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | FN ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | INJECT ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | INT _v ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
            | LBRACE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | LET ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | LPAREN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | MATCH ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | TFN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | VAR _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85)
        | INJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
        | LBRACE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | LBRACKET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | LPAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | MATCH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | PLUS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | STAR ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | SUB ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | TFN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84)
    | MenhirState85 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | FN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | INJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
        | LBRACE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | LBRACKET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | LPAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | MATCH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | PLUS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | STAR ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | SUB ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | TFN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
        | BAR | COMMA | EOF | EQUAL | IN | RBRACE | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((((_menhir_stack, _menhir_s), _, (p : (Ast.Lang.Pattern.t))), _, (e1 : (Ast.Lang.Term.t))), _), _, (e2 : (Ast.Lang.Term.t))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.Lang.Term.t) = 
# 60 "src/parser.mly"
                                           ( Term.Let(p, e1, e2) )
# 1768 "src/parser.ml"
             in
            _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState86)
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState87 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | FN ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | INJECT ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | INT _v ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
            | LBRACE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | LET ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | LPAREN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | MATCH ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | TFN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState89
            | VAR _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState89)
        | DIV ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | FN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | INJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
        | LBRACE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | LBRACKET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | LPAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | MATCH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | PLUS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState87 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.Lang.Term.t))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.Lang.Term.t) = 
# 65 "src/parser.mly"
                         ( e )
# 1840 "src/parser.ml"
             in
            _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
        | STAR ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | SUB ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | TFN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87)
    | MenhirState89 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | FN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | INJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v
        | LBRACE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | LBRACKET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | LPAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | MATCH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | PLUS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState90 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (e1 : (Ast.Lang.Term.t))), _), _, (e2 : (Ast.Lang.Term.t))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.Lang.Term.t) = 
# 58 "src/parser.mly"
                                          ( Term.Tuple(e1, e2) )
# 1892 "src/parser.ml"
             in
            _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
        | STAR ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | SUB ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | TFN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState90)
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | FN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | INJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _v
        | LBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState92 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | EXISTS ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | FORALL ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | LPAREN ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState93 in
                let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | EXISTS ->
                    _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState94
                | FORALL ->
                    _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState94
                | LBRACE ->
                    _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState94
                | LPAREN ->
                    _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState94
                | TY_INT ->
                    _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState94
                | VAR _v ->
                    _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
                | WILDCARD ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState94
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState94)
            | TY_INT ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | VAR _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState93)
        | LBRACKET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | LPAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | MATCH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | PLUS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | STAR ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | SUB ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | TFN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState92)
    | MenhirState99 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | FN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | INJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | LBRACE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | LBRACKET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | LPAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | MATCH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | PLUS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | STAR ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | SUB ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TFN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | BAR | RBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (p : (Ast.Lang.Pattern.t))), _, (e : (Ast.Lang.Term.t))) = _menhir_stack in
            let _4 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.Lang.Pattern.t * Ast.Lang.Term.t) = 
# 68 "src/parser.mly"
                                       ( (p, e) )
# 2028 "src/parser.ml"
             in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            (match _menhir_s with
            | MenhirState93 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | BAR ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | LPAREN ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_s = MenhirState102 in
                        let _menhir_stack = (_menhir_stack, _menhir_s) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | LBRACE ->
                            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState103
                        | LPAREN ->
                            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState103
                        | VAR _v ->
                            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
                        | WILDCARD ->
                            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState103
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | MenhirState102 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | RBRACE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (((((_menhir_stack, _menhir_s), _, (e : (Ast.Lang.Term.t))), _), _, (m1 : (Ast.Lang.Pattern.t * Ast.Lang.Term.t))), _, (m2 : (Ast.Lang.Pattern.t * Ast.Lang.Term.t))) = _menhir_stack in
                    let _7 = () in
                    let _5 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : (Ast.Lang.Term.t) = 
# 61 "src/parser.mly"
                                                                   ( Term.Match(e, m1, m2) )
# 2088 "src/parser.ml"
                     in
                    _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                _menhir_fail ())
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100)
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | FN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | INJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
        | LBRACE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | LBRACKET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | LPAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | MATCH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | PLUS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | STAR ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | SUB ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | TFN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
        | BAR | COMMA | EOF | EQUAL | IN | RBRACE | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (v : (
# 6 "src/parser.mly"
       (string)
# 2141 "src/parser.ml"
            ))), _, (e : (Ast.Lang.Term.t))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.Lang.Term.t) = 
# 62 "src/parser.mly"
                           ( Term.TLam(v, e) )
# 2148 "src/parser.ml"
             in
            _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState107 in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Ast.Lang.Term.t))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 45 "src/parser.mly"
       (Ast.Lang.Term.t)
# 2171 "src/parser.ml"
            ) = 
# 50 "src/parser.mly"
               ( e )
# 2175 "src/parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 45 "src/parser.mly"
       (Ast.Lang.Term.t)
# 2182 "src/parser.ml"
            )) = _v in
            Obj.magic _1
        | FN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | INJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
        | LBRACE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | LBRACKET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | LPAREN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | MATCH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | PLUS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | STAR ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | SUB ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | TFN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | VAR _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState107)
    | _ ->
        _menhir_fail ()

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 6 "src/parser.mly"
       (string)
# 2221 "src/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce27 _menhir_env (Obj.magic _menhir_stack)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.Lang.Type.t) = 
# 72 "src/parser.mly"
         ( Type.Int )
# 2236 "src/parser.ml"
     in
    _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXISTS ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | FORALL ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | TY_INT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | VAR _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOT ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | EXISTS ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | FORALL ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | TY_INT ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | VAR _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOT ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | EXISTS ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | FORALL ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | TY_INT ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | VAR _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState107 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState106 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState103 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState102 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState100 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState99 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState96 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState94 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState93 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState92 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState90 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState89 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState87 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState86 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState85 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState84 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState80 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState73 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState72 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState71 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState70 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState66 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState64 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState61 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState60 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState56 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState52 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 6 "src/parser.mly"
       (string)
# 2563 "src/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (v : (
# 6 "src/parser.mly"
       (string)
# 2571 "src/parser.ml"
    )) = _v in
    let _v : (Ast.Lang.Term.t) = 
# 54 "src/parser.mly"
          ( Term.Var(v) )
# 2576 "src/parser.ml"
     in
    _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAR _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOT ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | FN ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState4
            | INJECT ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState4
            | INT _v ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
            | LBRACE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState4
            | LET ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState4
            | LPAREN ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState4
            | MATCH ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4
            | TFN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState4
            | VAR _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | INJECT ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | LBRACE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | LPAREN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | MATCH ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | TFN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | INJECT ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | LBRACE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | LPAREN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | MATCH ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | TFN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LBRACE ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | LPAREN ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | VAR _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | WILDCARD ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXISTS ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | FORALL ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | TY_INT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | VAR _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48

and _menhir_run51 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 36 "src/parser.mly"
       (int)
# 2733 "src/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (n : (
# 36 "src/parser.mly"
       (int)
# 2741 "src/parser.ml"
    )) = _v in
    let _v : (Ast.Lang.Term.t) = 
# 53 "src/parser.mly"
          ( Term.Int(n) )
# 2746 "src/parser.ml"
     in
    _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v

and _menhir_run52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | INJECT ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
    | LBRACE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | LPAREN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | MATCH ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | TFN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52

and _menhir_run53 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | VAR _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COLON ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | EXISTS ->
                    _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | FORALL ->
                    _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | LPAREN ->
                    _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | TY_INT ->
                    _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | VAR _v ->
                    _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and main : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 45 "src/parser.mly"
       (Ast.Lang.Term.t)
# 2849 "src/parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INJECT ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | LBRACE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LPAREN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | MATCH ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | TFN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | VAR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 219 "/home/zhangrao/.opam/4.05.0/lib/menhir/standard.mly"
  


# 2890 "src/parser.ml"
