%{ 
  #include<stdio.h> 
  #include "y.tab.h" 
  void yyerror(char *);
%} 

%option noyywrap
%option yylineno

/* ---------- Gramatica ---------- */
CADENA \"[a-z]\"$
TOKEN [a-z]
DIGITO [0-9]

BOOLEANO "true"|"false" 

FUNC_IMPRIMIR "imprimir"

%%
{FUNC_IMPRIMIR}       { return IMPRIMIR; }
\"[a-z]+\"          { return STRING; }
{DIGITO}+             { yylval = atoi(yytext); return NUMERO; }
{TOKEN}               { yylval = *yytext - 'a'; return TOKEN; }

[-+()=/*;\"]       { return *yytext; }
[\t\r\n]+                                ;
.                 {fprintf(stderr, "Caracter no permitido: %s \n", yytext);};
%%