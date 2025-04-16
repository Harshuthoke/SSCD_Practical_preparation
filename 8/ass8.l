%{
    #include "y.tab.h"
    #include <stdlib.h>
%}

%%

[0-9]+              {
                        yylval.intval = atoi(yytext);
                        return NUMBER;
                    }

[a-zA-Z]+           {
                        yylval.fchar = yytext;
                        return NAME;
                    }

[\t ]+              ;       // Ignore whitespace

\n                  return 0;   // End of input on newline

.                   { return yytext[0]; } // Return single character tokens like +, -, *, /

%%

int yywrap() {
    return 1;
}
