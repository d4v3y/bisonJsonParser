%{

#include <stdio.h>
#include <stdlib.h>
#include "tree.h"

void yyerror(char *s);

%}

%union {
  double dVal;
  char* sVal;
  struct treenode* node;
}

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

jsonStart : LCURLY pair RCURLY ;

array : LBRACKET arrVal RBRACKET ;

pair : variable COLON value | variable COLON value COMMA pair ;

value : STRINGLIT | NUMBER | jsonStart | array ;

variable : STRINGLIT | NUMBER ;

arrVal : STRINGLIT | NUMBER | variable COMMA arrVal ;

%%
extern FILE *yyin;

void print_tree(struct treenode *n) {

  int i;
  
  if (n == NULL) {
    return; /* don't segfault on NULLs */
  }

  printf("node %d\n", n->label);
  
  if (n->nkids == 0) {
    /* print stuff about leaf */
  } else {
    for (i = 0; inkids; i++) {
      print_tree(n->kids[i]);
    }
  }
}

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
