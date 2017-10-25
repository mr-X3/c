/*
Assignment no.    : 
Problem Statement : Generate the target code for optimized three 
                    address code 
class:BE(B) 09


//--------------------target.l------------------------------------*/
%{
#include"stdio.h"
#include"y.tab.h"
%}

%%

[a-z][a-zA-Z0-9]* |
[0-9]+                  {
                                strcpy(yylval.vname,yytext);
                                return NAME;
                        }

[ |\t]                  ;

.|\n                    { return yytext[0]; }





==================================================================
target.y
==================================================================


%{

#include"stdio.h"
FILE *fpOut;

%}

%union
{
        char vname[10];
        int val;
}

%left '+' '-'
%left '*' '/'

%token <vname> NAME
%type <vname> expression

%%

input   : line '\n' input
          | '\n' input
          | ;


line    : NAME '=' expression  {
                                  fprintf(fpOut,"MOV %s, AX\n",$1);
                                         }
        ;


expression: NAME '+' NAME      {
                                  fprintf(fpOut,"MOV AX, %s\n",$1);
                                  fprintf(fpOut,"ADD AX, %s\n",$3);
                                         }

          | NAME '-' NAME        {
                                  fprintf(fpOut,"MOV AX, %s\n",$1);
                                  fprintf(fpOut,"SUB AX, %s\n",$3);
                                         }

          | NAME '*' NAME        {
                                  fprintf(fpOut,"MOV AX, %s\n",$1);
                                  fprintf(fpOut,"MUL AX, %s\n",$3);
                                         }

          | NAME '/' NAME        {
                                  fprintf(fpOut,"MOV AX, %s\n",$1);
                                  fprintf(fpOut,"DIV AX, %s\n",$3);
                                         }
          | NAME                 {
                                  fprintf(fpOut,"MOV AX, %s\n",$1);
                                  strcpy($$, $1);
                                         }
          ;

%%

FILE *yyin;
main()
{
        FILE *fpInput;

        fpInput = fopen("ip.txt","r");
        if(fpInput=='\0')
        {
                printf("file read error");
                exit(0);
        }
        fpOut = fopen("op.txt","w");
        if(fpOut=='\0')
        {
                printf("file creation error");
                exit(0);
        }
        yyin = fpInput;
        yyparse();
        fcloseall();
}


yyerror(char *msg)
{
        printf("%s",msg);
}
