grammar carlos_gramatica; 

init: 
            declaraVar 'inicio' tab 
                declaraVar  cmd 'fim' ;

declaraVar: (tab tipo VAR PV )*  ;

tipo: tab ('inte'| 'chare' | 'double' ) ;

cmd: tab (tab2 cmdAtrib |nL tab2 cmdSe |nL tab2 cmdFaca | nL tab2 cmdPara |tab2 cmdEnquanto |nL tab2 cmdLer |tab2 cmdImprimir | tab2 vpp pvNewLine |nL  tab2 livraria)*; 
// { \n cmd \n}\n;
bloco: AC tab cmd FC  ; 
pvNewLine: PV  {saida+="; \n";} ;
nL: {saida+="\n";};
tab: {saida+="\t";} ;
tab2: {saida+="\t\t";} ;

//if(compara){cmd}else{cmd}
cmdSe: 'se'  AP  compara FP  bloco  tab2  //ver tabulação
        (('senao' bloco tab2)
        | ('senaoSe' tab  AP compara FP bloco tab ) )* ;

//while(){cmd}; // enquanto (compara){cmd}
cmdEnquanto: 'enquanto' AP compara FP bloco tab2 ;

//do{}while(); // faça {cmd} enquanto(compara);
cmdFaca: 'faça' bloco 'enquanto' tab2 AP compara FP PV;

//for(i=0;compara;i++){bloco} // para(cont<-0; compara; cont++){bloco}
cmdPara: 'para' AP atrib ';' compara ';' vpp FP bloco tab2; 
vpp: VAR  '<++'; 

compara: valor OP_REL valor;

//ler(tipo, var)
livraria: 'abrelivro>>' // chama Scanner
        | 'fechalivro>>'; //fecha input.scanner

cmdLer: 'ler'  AP valor FP '.' scan PV ;
scan:     'inte' 
        | 'chare'
        | 'double'
        ;

cmdImprimir: 'imprime' AP valor ('+' valor)* FP PV  ;

//VAR <- valor;
cmdAtrib: atrib pvNewLine ;
atrib: VAR  '<-'   valor;

valor:   VAR
        | NUM
        | DOUBLE 
        | TEXTO 
        | valete 
        ;

valete: rainha exp1;
exp1: ('+' | '-' ) rainha exp1 | ;
rainha: rei  exp2;
exp2: ('*' | '/' ) rei exp2 | ; // string vazia (epsylon) é alternativa vazia "| ;"
rei: AP valete FP | DOUBLE | NUM | VAR ;

//Tokens precisam estar em maiúsculo 
VAR: (LETRAS)(LETRAS | NUM)*; //[A-Za-z]([A-Za-z]|[0-9])*; 
LETRAS: [A-Za-z]+;
NUM: DIGIT+;
fragment DIGIT: [0-9];
DOUBLE: NUM'.'NUM;

//A posição/ordem deles afeta o processamento.
TEXTO: '"' (NUM| LETRAS | ' ' | ':' | '!' | '?' | '.'| '~' | ',' | '+' | '-' |'*' | '/')+ '"';
OP_REL: '<' | '>' | '<=' | '>=' | '!=' | '==' ; //ver problema do espaço
PV: ';';
AP: '(';
FP: ')';
AC: '{';
FC: '}';
WS: [ \t\r\n]+ -> skip;