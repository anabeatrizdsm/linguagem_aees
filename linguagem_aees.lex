%{
#include "y.tab.h"
%}

ID [A-Za-z_][A-Za-z0-9_]*
NUM [0-9]+

%%

"Start"					{ return tBegin; }
"stop"					{ return tFim; }
"{"						{ return tAbreChave; }
"}"						{ return tFechaChave; }
"="						{ return tIgual; }
"@"						{ return tArroba; }
"read"					{ return tRecebe; }
"("						{ return tAp; }
")"						{ return tFp; }
">"						{ return tMaior; }
"<"						{ return tMenor; }
"+"						{ return tMais; }
"-"						{ return tMenos; }
"Write"					{ return tEscreve; }
"_"						{ return tUnder; }
"!"						{ return tExclama; }
"[" 					{ return tAbreColchetes;}
"]"	 					{ return tFechaColchetes;}
"->" 					{ return tSeta;}
">>" 					{ return tInicioCheck;}
":"						{ return tDoisPontos;}
";"			  			{ return tPontoVirgula;}
"%" 					{ return tPorcent;}
"repeat" 			    { return tRepeat;}
"cond" 	 				{ return tCond;}
"whenever" 				{ return tWhenever;}
"when not" 				{ return tWhenNot;}
"choice"				{ return tChoice;}
"check"					{ return tCheck;}
"write"					{ return tWrite;}
"stop check"			{ return tStopCheck;}
"standart"				{ return tStandart;}
"activity"				{ return tActivity;}
".lib"					{ return tLib;}
"%numstring.io%"		{ return tNumString;}
"%condrepeatchoice%"	{ return tCRC;}
".const" 				{ return tConst;}
".string" 				{ return tVarString;}
".num"					{ return tNum;}
{ID}					{ return tId; }
{NUM}					{ return tNumero; }
"," 					{ return tVirgula;}
"none"					{ return tNone; }
[ \n\t]		
.						{ return *yytext; }

%%
