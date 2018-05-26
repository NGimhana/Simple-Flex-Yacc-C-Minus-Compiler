Compiler: lex.yy.o SyntaxChecker.tab.o
	gcc -o Compiler $^

SyntaxChecker.tab.h: SyntaxChecker.y
	bison --debug --verbose -d SyntaxChecker.y

SyntaxChecker.tab.c: SyntaxChecker.y
	bison -d SyntaxChecker.y

lex.yy.c: SyntaxChecker.flex SyntaxChecker.tab.h
	flex  SyntaxChecker.flex
