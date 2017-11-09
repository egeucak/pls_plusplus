makeYacc: lexFile.l yaccFile.y
	lex lexFile.l
	yacc yaccFile.y
	gcc -o pls++ lex.yy.c -lfl -w
	./pls++ < test.txt
