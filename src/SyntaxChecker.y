%{                                                                                   
   #include <stdarg.h> 
   #include "SyntaxChecker_shared.h"                                                        
   #define YYSTYPE char * 
   void yyerror (char const *);                                                           
   int yydebug=1;                                                                    
   int indent=0;                                                                     
   char *iden_dum;                                                                   
%}   
                                                                                
%token INT                                                                           
%token ELSE
%token IF
%token RETURN
%token VOID
%token WHILE
%token PLUS
%token MINUS
%token MUL
%token DIV
%token LT
%token LTEQU
%token GT
%token GTEQU
%token EQU
%token NOTEQU
%token ASIGN
%token COLON
%token COMMA
%token LCURLY
%token RCURLY
%token LBRA
%token RBRA
%token LSQU
%token RSQU
%token COM
%token ID
%token NUM                                                                  	
 
%% /* Grammar rules and actions follow */      
                                      
program:
	declaration-list
;                                         
declaration-list:
	declaration-list declaration|
	declaration
;
declaration:
 	var-declaration|
  	fun-declaration 	
;                                                       
var-declaration:
	type-specifier ID COLON| 
	type-specifier ID LSQU NUM RSQU COLON
;
type-specifier:
	INT|
	VOID
;
fun-declaration:
	type-specifier ID LBRA params RBRA compound-stmt
;
params:
  param-list|
  VOID
;
param-list:
	param-list COMMA param|
	param
;
param:
	type-specifier ID|
	type-specifier ID LSQU RSQU
;
compound-stmt:
	LCURLY local-declarations statement-list RCURLY
;
local-declarations:
	local-declarations var-declaration| 
	%empty
;
statement-list:
	statement-list statement| 
	%empty
;
statement:
	expression-stmt| 
	compound-stmt| 
	selection-stmt| 
	iteration-stmt|
	return-stmt
;
expression-stmt:
	expression COLON|COLON
;
selection-stmt:
	IF LBRA expression RBRA statement|
	IF LBRA expression RBRA statement ELSE statement
;
iteration-stmt:
	WHILE LBRA expression RBRA statement
;
return-stmt:
	RETURN COLON| 
	RETURN expression COLON
;
expression:
	var ASIGN expression| 
	simple-expression
;
var:
	ID| 
	ID LSQU expression RSQU
;
simple-expression:
	additive-expression relop additive-expression|
	additive-expression	
;
relop:
	LT| 
	LTEQU|
	GT| 
	GTEQU| 
	EQU| 
	NOTEQU
;
additive-expression:
	additive-expression addop term|
	term
;
addop:
	PLUS|
	MINUS
;
term:
	term mulop factor| 
	factor
;
mulop:
	MUL|
	DIV
;
factor:
	LBRA expression RBRA|
	var|
	call| 
	NUM
;
call:
	ID LBRA args RBRA
;
args:
	arg-list|
	%empty
;
arg-list:
	arg-list COMMA expression|
	expression
;
                                                                           
%%                                                                                   

#include <stdio.h>
void yyerror(char const *s)
{
	fprintf(stderr,"%s\n",s);
}
 
main ()

{
	if( yyparse()==0 ){
		printf("Syntax valid \t\n");
	}else{
		printf("Syntax error at line: %d  \t\n", line_number);
	}

}

