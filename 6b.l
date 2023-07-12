//lex file

%{
#include<stdio.h>
#include"y.tab.h"
%}

%%
[+|\-|\*|\/|=|<|>|(|)|{|}|] {printf("Operator is: %s\n",yytext);return OP;}
int|char|float|double|void|bool|if|else|return|break|continue|printd|scanf|main {printf("keyword is: %s\n",yytext);return KEY;}
_?[a-z|A-Z]_?[a-z|A-Z|0-9]* {printf("Identifier is: %s\n",yytext);return ID;}
. {;}
%%

//yacc file

%{
#include<stdio.h>
#include<stdlib.h>
int id=0,key=0,op=0;
%}


%token ID KEY OP
%%
input: ID input {++id;}
	|KEY input{key++;}
	|OP input {++op;}
	|ID {++id;}
	|KEY {++key;}
	|OP {++op;}
	;
%%
extern FILE *yyin;
void main()
{
	FILE *myfile=fopen("input.txt","r");
	yyin=myfile;
	yyparse();
	printf("Keywords= %d\n",key);
	printf("Operators= %d\n",op);
	printf("Identifiers= %d\n",id);
}

void yyerror()
{
	printf("error");
	exit(0);
}
int yywrap()
{
	return 1;
}



