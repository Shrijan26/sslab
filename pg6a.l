%{
#include<stdio.h>
int sl=0,ml=0;
%}

%%
"/*"[a-zA-Z0-9' '\t\n]+"*/" ml++;
"//".* sl++;
%%

int main()
{
	yyin=fopen("input.c","r");
	yyout=fopen("output.c","w");
	yylex();
	fclose(yyin);
	fclose(yyout);
	printf("\n No of multiline comments: %d",ml);
	printf("\n No of singleline comments: %d",sl);
	return 0;
}
