%option noyywrap

DIGIT       [0-9]
OPERATOR    [-+*/]
PARENTHESIS [()]

%%
{DIGIT}+        { printf("NUMBER: %s\n", yytext); }
{OPERATOR}      { printf("OPERATOR: %s\n", yytext); }
{PARENTHESIS}   { printf("PARENTHESIS: %s\n", yytext); }
[ \t\n]         ;
.               { printf("INVALID: %s\n", yytext); }
%%

void main() {
    yylex();
}