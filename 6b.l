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



