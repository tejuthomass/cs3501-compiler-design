%{ 
int capital = 0;
int non_capital = 0;
%}

%option noyywrap

%%
[A-Z]   { 
    printf("%s is a capital letter\n", yytext);
    capital++;
}

.       {
    printf("%s is not a capital letter\n", yytext);
    non_capital++;
}

\n      { return 0; }
%%

void main() {
    yylex();
    printf("\nNumber of capital letters: %d\nNumber of non-capital letters: %d\n", capital, non_capital);
}