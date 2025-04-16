%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>

    int yylex();            // Declaration for the lexer
    int yyerror(char *s);  // Error handling function
%}

%union {
    char* fchar;
    double fval;
    int intval;
}

%token <fchar> NAME
%token <intval> NUMBER
%type  <fval> exp

%left '+' '-'
%left '*' '/'
%left '^'

%%

start:
      NAME '=' exp        { printf("= %f\n", $3); }
    | exp                 { printf("= %f\n", $1); }
    ;

exp:
      exp '+' exp         { $$ = $1 + $3; }
    | exp '-' exp         { $$ = $1 - $3; }
    | exp '*' exp         { $$ = $1 * $3; }
    | exp '/' exp
        {
            if ($3 == 0) {
                yyerror("Divide by zero");
                exit(1);
            }
            $$ = $1 / $3;
        }
    | NUMBER              { $$ = $1; }
    ;

%%

int yyerror(char *s) {
    printf("Error: %s\n", s);
    return 0;
}

int main() {
    printf("Enter arithmetic expression:\n");
    yyparse();
    return 0;
}
