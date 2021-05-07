LETTER [A-Za-z]
WS [ \t\n]
DIGIT    [0-9]

%{
	#define WORD 1
	#define DIGIT 2
%}

%%
{DIGIT}+"."+{DIGIT} { return (DIGIT) ;}
{LETTER}+ { return (WORD) ; }
{WS}      {   }
.         {   }

%%
#include <stdio.h>
int main(int argc, char **argv)
{
	FILE *fp;
	int ret_val;
	if(argc != 2){
		printf("Usage %s <input fi le>\n",argv[0]);
		exit(1);
	}
	if((fp = fopen(argv[1],"r")) == NULL ){
		printf("File [%s] does not exist \n",argv[1]);
		exit(1);
	}
	yyin = fp; /* Input fi le to lexical analyser */
	while (1) {
		if( (ret_val=yylex()) == 0 ){
			break;
		}
		/* return value signifi es token type */
		if(ret_val == WORD ){
			printf("Lexeme=[%s] \t length=%d ",yytext,yyleng);
			printf(" \t Token is WORD \n");
		}
		if(ret_val == DIGIT){
			printf("Lexeme=[%s] \t length=%d ",yytext,yyleng);
			printf(" \t Token is DIGIT \n");
		}
	}
}
