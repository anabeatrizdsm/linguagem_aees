%{
#include<stdio.h>
%}

%token	tBegin
%token	tFim
%token	tAbreChave
%token	tFechaChave
%token	tIgual
%token	tArroba
%token	tRecebe
%token	tAp
%token	tFp
%token	tMaior
%token	tMenor
%token	tMais
%token	tMenos
%token	tEscreve
%token	tUnder
%token  tEsclama
%token 	tAbreColchetes
%token	tFechaColchetes
%token 	tSeta
%token 	tInicioCheck
%token	tDoisPontos
%token	tPontoVirgula
%token 	tPorcent
%token	tId
%token	tNumero
%token 	tRepeat
%token 	tCond
%token 	tWhenever
%token 	tWhenNot
%token	tChoice
%token	tCheck
%token 	tWrite
%token	tStopCheck
%token	tStandart
%token	tActivity
%token	tLib
%token	tNumString
%token	tCRC
%token 	tConst
%token 	tVarString
%token	tNum

%left '*' '/'
%left '+' '-'

%start inicio

%%

inicio : libNumString libCRC body ;

libNumString: tLib tPorcent tNumString tPorcent | ;
libCRC: tLib tPorcent tCRC tPorcent | ;

constante: tConst tPorcent tId tPorcent tIgual tAp tipo tFp tExclama ; 
tipo : tNum | tVarString ;

/******Programa principal******/
body: tBegin tAp tFp tAbreChave corpo tFechaChave tFim tExclama ;

variavel: tNum tPorcent iId tPorcent tIgual tNumero tExclama | 
		  tVarString tPorcent iId tPorcent tIgual tId tExclama | 
		  tVarString tPorcent iId tPorcent tExclama | 
		  tNum tPorcent iId tPorcent tExclama ;

entrada: tRecebe tMenor tId tMaior tExclama;
saida: tEscreve tMenor tId tMaior tExclama;

incremento: tId tMais tMais ;
decremento: tId tMenos tMenos ;
incre_decre: incremento | decremento ;

/******Estrutura de repetição******/
repete: tAbreColchetes tRepeat tFechaColchetes tId tIgual tNumero tExclama 
		tId tMaior tNumero tExclama incre_decre tAbreChave corpo tFechaChave;

corpo: variavel | entrada | saida | condicao | seletiva | repete ;

/******Estrutura seletiva*******/
seletiva: 	tAbreColchetes tChoice tFechaColchetes
			tAp tId tFp tAbreChave tAbreColchetes 
			tCheck tFechaColchetes tNumero tInicioCheck 
			corpo_seletiva ;

			corpo_seletiva: varivavel | entrada | saida | repete | condicao ;

			tMenor tStopCheck tMaior ;
			tAbreColchetes tStandart tFechaColchetes tInicioCheck tWrite tMenor tId tMenor tEsclama ;
			tFechaChave ;

/******Estrututa condicional******/

condicao: tAbreColchetes tCond tFechaColchetes tAbreChave 
		  tWhenever tAp tId tIgual tId 
		  | tId tMaior tId 
		  | tId tMenor tId 
		  | tId tIgual tNum 
		  | tId tMaior tNum 
		  | tId TMenor tNum tFp ;

		corpo_da_estrutura: variavel | entrada | saida | condicao | seletiva | repete | incremento | decremento;
		
		tSeta corpo_da_estrutura | ;

		tWhenNot tSeta corpo_da_estrutura | ;

		tFechaChave;

%%

int main(void)
{
   yyparse();
   return(1);
}

int yywrap(void)
{
   return(1);
}

int yyerror(void)
{
    printf("Error\n");
    return(1);
}

