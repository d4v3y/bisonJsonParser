%{
#include <stdio.h>
#include <stdlib.h>
%}

%token TRUE
%token FALSE
%token NULL
%token LCURLY
%token RCURLY
%token COMMA
%token COLON
%token LBRACKET
%token RBRACKET
%token STRING
%token NUMBER
%token WHITESPACE

%%

object
    : '{' '}' 
    | '{' STRING ':' value '}' 
    | ',' value
    ;

array
    : '[' ']'
    | '[' value ']'
    | ',' value
    ;

value
    : STRING
    | NUMBER
    | object
    | array
    | TRUE
    | FALSE
    | NULL
    ;

%%

