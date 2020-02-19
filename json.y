%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "tree.h"
%}

%union {
	double dval;
	char* sVal;
	char cVal;
}

// Not sure what these would be
/* 	
	%type <sVal> TRUE
	%type <sVal> FALSE
	%type <sVal> NULL
*/

%token <cVal> LCURLY
%token <cVal> RCURLY
%token <cVal> COMMA
%token <cVal> COLON
%token <cVal> LBRACKET
%token <cVal> RBRACKET
%token <sVal> STRINGLIT
%token <dval> NUMBER

%%
program : LCURLY statements RCURLY ;

statements : statement
	    | statement COMMA statement
	    ;

statement : object
	    | array
	    ;

object : variable COLON value
	| object COMMA
	;

array : variable COLON statement
	;

variable : STRINGLIT ;

value : NUMBER
	| STRINGLIT
	;

%%

void printTree(struct treenode *n) {

  int i;

  if (n == NULL) {
     return; /* don't segfault on NULLs */
  }

  printf("node %d\n", n->label);
  
  if (n->nkids==0) {
     /* print stuff about leaf */
  } else {
     for (i = 0; inkids; i++) {
	 print_tree(n->kids[i]);
     }
  }
}