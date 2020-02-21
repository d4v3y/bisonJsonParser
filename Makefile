cc = gcc
ccopts = -ly
lex = lex
lexgens = lex.yy.c
yacc = yacc
yaccopts = -d
yaccgens = y.tab.c y.tab.h
prj = json

$(prj): $(lexgens) $(yaccgens)
	$(cc) $(lexgens) $(yaccgens) $(ccopts) -o $(prj)

clean:
	rm $(lexgens) $(yaccgens) $(prj)

cleanTrash:
	rm $(lexgens) $(yaccgens)

$(yaccgens): $(prj).y
	$(yacc) $(yaccopts) $(prj).y

$(lexgens): $(prj).l $(yaccgens)
	$(lex) $(prj).l
