%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *s);
%}

%token TRUE_T   
%token FALSE_T  
%token NULL_T   
%token LCURLY  
%token RCURLY  
%token COMMA  
%token LBRACKET 
%token RBRACKET 
%token STRINGLIT 
%token NUMBER  

%left COLON  
%start jsonStart

%%

jsonStart : LCURLY pair RCURLY  {
    $$ = calloc(1,sizeof(struct treenode));
    $$->label = PRODRULE;
    $$->nkids = 3;
    $$->kids[0] = $1;
    $$->kids[1] = $2;
    $$->kids[2] = $3;
};

array : LBRACKET arrVal RBRACKET ;

pair : variable COLON value | variable COLON value COMMA pair ;

value : STRINGLIT | NUMBER | jsonStart | array ;

variable : STRINGLIT | NUMBER ;

arrVal : STRINGLIT | NUMBER | variable COMMA arrVal ;

%%
extern FILE *yyin;

int main(int argc, char *argv[]) {

  if (argc < 2) { 
    fprintf(stderr, "usage: dates filename\n"); 
    exit(-1); 
  }

  yyin = fopen(argv[1],"r");

  if (yyparse() == 0) {
    printf("no errors\n");
  } else {
    printf("there were errors\n");
  }
}

void yyerror(char *s) {
  printf("%s\n", s);
}
