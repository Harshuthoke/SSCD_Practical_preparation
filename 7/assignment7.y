%{
#include<stdio.h>
extern int yylex();
extern int yywrap();
extern int yyparse();
extern int yyerror(char *str);
%}

%token WH IF DO FOR OP CP OCB CCB CMP SC ASG ID NUM COMMA OPR

%%
start:	sif;
sif:	IF OP cmpn CP stmt			{printf("VALID STATEMENT IF\n");};
cmpn:	ID CMP ID | ID CMP NUM;
stmt: ID ASG expr SC;

expr: ID OPR ID
    | ID OPR NUM
    | NUM OPR ID
    | NUM OPR NUM
    | ID
    | NUM;

%%
int yyerror(char *str)x
{
	printf("%s", str);
}

int main()
{
	yyparse();
	return 1;
}

