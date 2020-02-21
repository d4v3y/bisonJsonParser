%{

#include <stdio.h>
#include "y.tab.h"

%}

%option yylineno
%option noyywrap

DIGITS [#0-9a-zA-Z.\-\+ ]+
WORDS  [ \-\\\_a-zA-Z0-9\".\/]*

%%

[ \t\n]+        { /* skip */ }  // Ignore whitespace

{WORDS} { 
        yylval.sVal = yytext;
        return STRINGLIT; 
    }

{DIGITS} { 
        yylval.dVal = atof(yytext);
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