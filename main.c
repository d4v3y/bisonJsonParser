#include <stdio.h>
#include <stdlib.h>

#include "json.tab.h"

extern FILE *yyin;
extern char *yytext;

char *yyfilename;

int main(int argc, char *argv[]) {

    int i;
    
    if (argc < 2) {
        printf("usage: iscan file.dat\n");
        exit(-1);
    }

    yyin = fopen(argv[1], "r");
    
    if (yyin == NULL) {
        printf("can't open/read '%s'\n", argv[1]);
        exit(-1);
    }

    yyfilename = argv[1];

    if ((i = yyparse()) != 0) {
        printf("parse failed\n");
    } else {
        printf("no errors\n");
    }

    return 0;
}