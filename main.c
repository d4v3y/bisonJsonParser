#include "json.h"
#include <stdio.h>
#include <stdlib.h>

extern FILE *yyin;
extern char *yytext;

char *yyfilename;

int main(int argc, char *argv[]) {

   int t;
   
   if (argc < 2) { 
      printf("usage: json file.json\n"); 
      exit(-1); 
   }

   yyin = fopen(argv[1],"r");
   
   if (yyin == NULL) { 
      printf("can't open/read '%s'\n", argv[1]); 
      exit(-1); 
   }

   yyfilename = argv[1];
   
   while ((t=yylex()) > 0) {
    
      if (t <= 32) {
         printf("token %d text %s\n", t, yytext);
      } else {
         printf("token %c\n", t);
      }
   }

   return 0;
}