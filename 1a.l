%{
#include&lt;stdio.h&gt;
int v=0,op=0,id=0,flag=0;
%}
%%
[0-9][0-9]* {id++;printf(&quot;\nIdentifier:&quot;);ECHO;}
[\+\-\*\/\=] {op++;printf(&quot;\nOperartor:&quot;);ECHO;}
&quot;(&quot; {v++;}
&quot;)&quot; {v--;}
&quot;;&quot; {flag=1;}
.|\n {return 0;}
%%

int main()
{
  printf(&quot;Enter the expression:\n&quot;);
  yylex();
  if((op+1) ==id &amp;&amp; v==0 &amp;&amp; flag==0)
  {
        printf(&quot;\n\nIdentifiers are:%d\nOperators are:%d\n&quot;,id,op);
        
        printf(&quot;\nExpression is Valid\n&quot;);
  }
  else
        printf(&quot;\nExpression is Invalid\n&quot;);
  return 1;
}
int yywrap()
{
return 1;
}
