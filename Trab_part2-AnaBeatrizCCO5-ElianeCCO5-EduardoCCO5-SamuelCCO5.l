%{
	#include "y.tab.h"
%}

ID [A-Za-z _] [A-Za-z0-9 _] *
NUM [0-9] +

%%

"Iniciar" 	{return tBegin; }
"pare" 		{return tFim; }
"{" 		{return tAbreChave; }
"}" 		{return tFechaChave; }
"=" 		{return tIgual; }
"@" 		{retornar tArroba; }
"ler" 		{return tRecebe; }
"(" 		{return tAp;}
")" 		{return tFp; }
">" 		{return tMaior; }
"<" 		{return tMenor; }
"+" 		{return tMais; }
"-" 		{return tMenos; }
"Escrever" 	{return tEscreve; }
"_" 		{return tUnder; }
"!" 		{return tEsclama; }
"[" 		{return tAbreColchetes;}
"]" 		{return tFechaColchetes;}
"->" 		{return tSeta;}
">>" 		{return tInicioCheck;}
":" 		{return tDoisPontos;}
";" 		{return tPontoVirgula;}
"%" 		{return tPorcent;}
{ID} 		{return tId; }
{NUM} 		{return tNumero; }
"repetir"	 	{return tRepeat;}
"cond" 			{return tCond;}
"sempre" 		{return tWhenever;}
"quando não" 	{return tWhenNot;}
"escolha" 		{return tChoice;}
"verificar" 	{return tCheck;}
"parar cheque" 	{return tStopCheck;}
"standart" 		{return tStandart;}
"atividade" 	{return tActivity;}
".lib" 			{return tLib;}
"% numstring.io%" 		{return tNumString;}
"% condrepeatchoice%" 	{return tCRC;}
".const" 	{return tConst;}
".string" 	{return tVarString;}
".num" 		{return tNum;}
[\ n \ t]		
. 			{return * yytext; }


%%