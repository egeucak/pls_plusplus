makeYacc: project.l project.y
	lex project.l
	yacc project.y
	gcc -o pls++ lex.yy.c -lfl -w
	./pls++ < test.txt
