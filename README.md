# Simple-Flex-Yacc-C-Minus-Compiler
Simple Flex/Yacc compiler for C Minus Language
This is a simple syntax validating program for C- Language.

## Block Diagram
![alt text](https://raw.githubusercontent.com/NGimhana/Simple-Flex-Yacc-C-Minus-Compiler/master/flex_yacc.png)

Here we are using Bison as the Parser Generator ( yacc ) and the Flex ( lex ) as the Token Generator.
[ example => SyntaxChecker ]

## Set of Grammer Supported (Syntax and Semantics)
![alt text](https://raw.githubusercontent.com/NGimhana/Simple-Flex-Yacc-C-Minus-Compiler/master/Syntax/syntax1.png)
![alt text](https://raw.githubusercontent.com/NGimhana/Simple-Flex-Yacc-C-Minus-Compiler/master/Syntax/syntax2.png)

## Usage
1. Clone the repo
2. Build src using **make** command. Just Type make in the src directory.[Tested only in Linux-Have to configure make in windows]
3. Executable File , **Compiler** created in src directory.
4. Testing
    ./Compiler <test1.c
    ./Compiler <test2.c
Those test1.c and test2.c can be found at Tests folder. You can use another test files also.
_Make sure to put test files in the same directory of **Compiler** exists._

