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
%token  tExclama
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
%token 	tVirgula
%token 	tNone

%left '*' '/'
%left '+' '-'

%start inicio

%%

inicio : libNumString libCRC body ;

libNumString: tLib tPorcent tNumString tPorcent | ;
libCRC: tLib tPorcent tCRC tPorcent | ;

/*constante : tConst tPorcent tId tPorcent tIgual tAp tipo tFp tExclama ; 
tipo : tNum | tVarString ;*/

/******Programa principal******/
body: tBegin tAp tFp tAbreChave instrucoes constante escolha tFechaChave tFim tExclama functions ;
escolha : repete | seletiva | condicao | ;

constante : tConst tPorcent tId tPorcent tIgual tAp tipo tFp tExclama ; 
tipo : tNum | tVarString ;

variavel : tNum tPorcent tId tPorcent tIgual tNumero tExclama | 
		   tVarString tPorcent tId tPorcent tIgual tId tExclama | 
		   tVarString tPorcent tId tPorcent tExclama | 
		   tNum tPorcent tId tPorcent tExclama ;

entrada: tRecebe tMenor tId tMaior tExclama;
saida: 	 tEscreve tMenor tId tMaior tExclama;

incremento : tId tMais tMais ;
decremento : tId tMenos tMenos ;
incre_decre : incremento | decremento ;

/******Estrutura de repeticao******/

op: tMaior | tMenor | tIgual ;
repete: tAbreColchetes tRepeat tFechaColchetes tId tIgual tNumero tExclama 
		tId op tNumero tExclama incre_decre tAbreChave instrucoes tFechaChave ;

instrucoes: variavel | entrada | saida | condicao | seletiva | repete ;

/******Estrutura seletiva*******/
estrutura_seletiva: tAbreColchetes tChoice tFechaColchetes tAp tId tFp tAbreChave instrucoes_seletiva;
inicio_seletiva: estrutura_seletiva ;
instrucoes_seletiva: inicio_seletiva variavel | entrada | saida | repete | condicao ;
corpo_seletiva: instrucoes_seletiva ;

standart: tAbreColchetes tStandart tFechaColchetes corpo_seletiva tExclama;
seletiva: tAbreColchetes tCheck tFechaColchetes tNumero tInicioCheck corpo_seletiva standart tMenor tStopCheck tMaior;

/******Estrututa condicional******/

condicao: tAbreColchetes tCond tFechaColchetes tAbreChave  
		  tWhenever tAp tId tIgual tId
		  | tId tMaior tId 
		  | tId tMenor tId 
		  | tId tIgual tNum 
		  | tId tMaior tNum 
		  | tId tMenor tNum tFp seta corpoestrutura tWhenNot seta tFechaChave ;
		
		seta : tSeta ;
		corpoestrutura: variavel | entrada | saida | condicao | seletiva | repete | incremento | decremento | ;

		/*função*/
parametros: tId tDoisPontos tipo tVirgula parametros | tId tDoisPontos tipo ;
retornoFuncao: tipo | tNone;
function: tAbreColchetes tActivity tFechaColchetes tId tAp parametros tFp tDoisPontos retornoFuncao tAbreColchetes instrucoes tFechaColchetes;
functions: function ;

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
