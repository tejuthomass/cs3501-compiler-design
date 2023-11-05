%{
int identifier_counter = 0;
%}

%option noyywrap

DIGIT       [0-9]
LETTER      [a-zA-Z]
IDENTIFIER  {LETTER}({LETTER}|{DIGIT}|_)*
NUMBER      {DIGIT}+
SPACE       [ \t]+
NEWLINE     [\n]

%%
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while" { printf("Keyword: %s\n", yytext); }
{IDENTIFIER}        { printf("Identifier %d: %s\n", ++identifier_counter, yytext); }
{NUMBER}            { printf("Number: %s\n", yytext); }
"+"|"-"|"*"|"/"|"%"|"=="|"!="|">"|"<"|">="|"<="|"&&"|"||"|"!"|"&"|"|"|"^"|"~"|"<<"|">>"|"="|"+="|"-="|"*="|"/="|"%="|"&="|"|="|"^="|"<<="|">>="|"++"|"--"|"?:"|"&"|"*"|"sizeof"|"."|"->"|"," { printf("Symbol: %s\n", yytext); }
{SPACE}|{NEWLINE}   ;
.                   { printf("Unknown: %s\n", yytext); }
%%

void main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return;
    }

    FILE* file = fopen(argv[1], "r");

    if (!file) {
        perror("Error opening the file!");
        return;
    }

    yyin = file;
    yylex();
    fclose(file);
}