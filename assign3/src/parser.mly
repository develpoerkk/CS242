%{
  open Ast
  exception Unimplemented
%}

%token <string> VAR
%token EOF
%token ARROW
%token DOT
%token FN
%token LPAREN
%token RPAREN
%token COLON
%token PLUS
%token SUB
%token MUL
%token DIV
%token TY_INT
%token <int> INT

%left PLUS SUB
%left MUL DIV
%right ARROW

%start <Ast.Term.t> main

%%

main:
| e = expr EOF { e }

expr:
| e1 = expr e2 = expr2 { Term.App(e1, e2) }
| e = expr2 { e }

expr2:
| e1 = expr2 b = binop e2 = expr2 { Term.Binop(b, e1, e2) }
| n = INT { Term.Int(n) }
| FN LPAREN v = VAR COLON t = ty RPAREN DOT e = expr { Term.Lam(v, t, e) }
| v = VAR { Term.Var(v) }
| LPAREN e = expr RPAREN { e }

%inline binop:
| PLUS { Term.Add }
| SUB { Term.Sub }
| MUL { Term.Mul }
| DIV { Term.Div }

ty:
| TY_INT { Type.Int }
| t1 = ty ARROW t2 = ty { Type.Fn(t1, t2) }
