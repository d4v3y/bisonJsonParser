jsonpp: main.o lex.yy.o json.tab.o
	cc -o jsonpp main.o lex.yy.o json.tab.o -ll

main.o: main.c json.tab.h json.h
	cc -c -g main.c

lex.yy.o: lex.yy.c
	cc -c -g lex.yy.c

lex.yy.c: json.l json.h json.tab.h
	flex json.l

json.tab.o: json.tab.c
	cc -c -g json.tab.c

json.tab.c: json.y
	bison json.y

json.h: json.tab.h
	touch json.h

json.tab.h: json.y
	bison -d json.y

clean:
	rm *.o json.tab.h lex.yy.* jsonpp

cleanTrash:
	rm *.o json.tab.h lex.yy.*