%{

/*
    Davey Anguiano
    Clinton Jeffery
    CS 210
    02/16/20
*/

#include <stdio.h>
#include "y.tab.h"

%}

%option yylineno
%option noyywrap

%%

[ \t\n]+        { /* skip */ }  // Ignore whitespace

[ \-\\\_a-zA-Z0-9\".\/]*     { 
        return STRINGLIT; 
    }

[#0-9a-zA-Z.\-\+ ]+	        { 
        return NUMBER;
    }

'null'          { return NULL_T; }
'true'          { return TRUE_T; }
'false'         { return FALSE_T; }   
"{"             { return LCURLY; }
"}"             { return RCURLY; }
"["             { return LBRACKET; }
"]"             { return RBRACKET; }
","             { return COMMA; }
":"             { return COLON; }
.		        { printf("lexical error on line %d\n", yylineno); }

%%