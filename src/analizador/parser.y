%{
   #include <stdio.h>
   int yylex(void);
   void yyerror(char *s);
   void imprimirMemoria();
   int memoria[10];
   FILE *yyin;
%}

%token NUMERO TOKEN IMPRIMIR STRING

%left '+' '-'
%left '*' '/'

%%
   CODIGO: 
      LINEA';' | CODIGO LINEA';'
   
   LINEA:  
      ASIGNACION | EXPRESION                 { printf("Valor de la expresion: %d\n", $1); } ;
                                             
   ASIGNACION: TOKEN '=' EXPRESION           { printf("Se lee variable\n"); };

   EXPRESION:                                     
      NUMERO                                 { $$ = $1; }
      | STRING                               { printf("Se lee string\n"); }      
      | IMPRIMIR '(' EXPRESION ')'           { printf("Call to print\n"); }
      | EXPRESION '+' EXPRESION              { $$ = $1 + $3; }  
      | EXPRESION '-' EXPRESION              { $$ = $1 - $3; }  
      | EXPRESION '*' EXPRESION              { $$ = $1 * $3; } 
      | EXPRESION '/' EXPRESION              { $$ = $1 / $3; }  
   ;
%%

//driver code 

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

void parse(FILE *file) { 
   yyin = file;
   yyparse();
   fclose(yyin);
} 