%{
#include<stdio.h>
#include<string.h>
%}
headerfile "#include<"[a-z]+".h>"
datatype ([\t]*"int"|"float"|"char")
keyword ("if"|"else"|"then"|"do"|"while"|"return"|"void"|"for")
inbuilt "getch"|"clrscr"|"scanf(".*");"[\n]+|"printf(".*");"[\n]+
operator ("+"|"-"|"*"|"/")
comment ("/*"[\t\n]*.*[\n]*.*[\t\n]*.*"*/")
digit [0-9]+
identifier [_a-zA-Z]+[_a-zA-Z0-9]*

mainfun ("main()"[\t\n]+)
relation ("<"|">"|"="|"<="|">="|"!=")
smallbracket "("|")"
curlybracket "{"|"}"
squarebracket "["|"]"
punctuation (";"|"!"|"@"|"~"|"#"|"$"|"&"|"'")
%%
{headerfile} {
		
		printf("\n\t Header File: \t\t%s", yytext);
	      }
{datatype} {
		
		printf("\n\t Data Type: \t\t%s", yytext);
	      }
{keyword} {
		
		printf("\n\t Keyword: \t\t%s",yytext);
	      }
{inbuilt} {
		
		printf("\n\t inbuilt: \t\t%s", yytext);
	      }
{operator} {
		
		printf("\n\t Operator: \t\t%s", yytext);
	      }
{comment} {
		
		printf("\n\t Comment: \t\t%s",yytext);
	      }
{digit} {
		
		printf("\n\t Digit: \t\t%s", yytext);
	      }
{identifier} {
		
		printf("\n\t Identifier: \t\t%s ", yytext);
	      }
{mainfun} {
		
		printf("\n\t Main fun: \t\t%s", yytext);
	      }
{relation} {
		
		printf("\n\t Ralational op: \t\t%s", yytext);
	      }
{smallbracket} {
		
		printf("\n\t smallbracket: \t\t%s", yytext);
	      }
{curlybracket} {
		
		printf("\n\t curlybracket: \t\t%s", yytext);
	    }
{squarebracket} {
		
		printf("\n\t squarebarcket: \t\t%s", yytext);
	      }
{punctuation} {
		
		printf("\n\t punctuation: \t\t%s", yytext);
	      }


%%
main(int argc, char *argv[])
{

yylex();

}






======================================================
/*Input file*/ save as ip.txt
=======================================================

#include<stdio.h>
#include<conio.h>
void main()
{
int a=2,b=5,xyz;
if(a>b)
{
	printf("a is greater no.");  
}
else
{
	printf("b is greater no.");
}


getch();

}

=========================================================



steps to run


1 lex progname.l
2 cc lex.yy.c -ll
3 ./a.out <ip.txt





 	
