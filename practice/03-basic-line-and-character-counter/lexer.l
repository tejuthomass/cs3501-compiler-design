%{
int no_of_lines = 0;
int no_of_chars = 0;
%}

%option noyywrap

%%
\n  ++no_of_lines;
.   ++no_of_chars;
eof return 0;
%%

void main() {
    yylex();
    printf("\nNumber of lines: %d\nNumber of characters: %d\n", no_of_lines, no_of_chars);
}