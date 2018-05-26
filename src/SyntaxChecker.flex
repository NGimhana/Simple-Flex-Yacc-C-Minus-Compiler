%{                                                                                          
#include "SyntaxChecker.tab.h"                                                                     
extern int line_number;  
extern int col;                                                                     
%}                                                                                          
%option noyywrap                                                                            

ID  [a-zA-Z][a-zA-Z]*
NUM  [0-9][0-9]*
NEWLINE  [\n]
WHITESPACE [ \t\n]+ 
COM      "/*"(.|\n)*"*/"

%%                                                                                          

"int"           { return INT; }  
"else"          { return ELSE; }           
"if"            { return IF; }
"return"        { return RETURN; }
"void"          { return VOID; }
"while"         { return WHILE; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MUL; }
"/"             { return DIV; }
"<"             { return LT; }
"<="            { return LTEQU;}
">"             { return GT; }
">="            { return GTEQU; }
"=="            { return EQU; }
"!="            { return NOTEQU; }
"="             { return ASIGN; }
";"             { return COLON; }            
","             { return COMMA; }            
"{"             { return LCURLY; }            
"}"             { return RCURLY; }            
"("             { return LBRA; }
")"             { return RBRA; }            
"["             { return LSQU; }                                                         
"]"             { return RSQU; }             
{ID}            { return ID; }
{NUM}           { return NUM;}
{WHITESPACE}    { ; } /* eat up whitespace */
{NEWLINE}       { ; }  
{COM}		{ ; }

{COM}           { ; } /* eat up comments */ 

                                                                 
%%
