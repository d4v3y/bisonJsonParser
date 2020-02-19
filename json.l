%{

#include <stdio.h>
#include "tree.h"
#include "json.tab.h"

%}

%option yylineno
%option noyywrap

DIGIT    [0-9]
LETTER   [a-zA-Z]

DIGITS   [{DIGIT}.\-\+]+
HEXNUM   {#}({DIGIT | LETTER})*
STRLIT   [ \-\\\_{LETTER}{DIGIT}\".\/]*

%%

[ \t\n]+        { /* skip */ }  // Ignore whitespace
{STRLIT}	    { return ; }   // String token
{DIGITS}        { return 6; }   // Literial digit
'null'          TOKEN(NULL)
'true'          TOKEN(TRUE)
'false'         TOKEN(FALSE)   
\{              TOKEN(LCURLY)
\}              TOKEN(RCURLY)
\[              TOKEN(LBRACKET)
\]              TOKEN(RBRACKET)
\,              TOKEN(COMMA)
\:              TOKEN(SEMICOLON)
.		        { printf("lexical error on line %d\n", yylineno); }

%%