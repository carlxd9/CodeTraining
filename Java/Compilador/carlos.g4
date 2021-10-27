grammar carlos; 

@header { import java.util.*; }
@members {
	Variavel x = new Variavel();
	ControleVariavel cv = new ControleVariavel();
	String saida="";
	int escopo;
	int tipo;
	String nome;
}

init: {saida+="import java.util.*; \n\n public class Saida{\n"; }
            declaraVar 'inicio' tab {saida+="public static void main(String args[]){\n"; } 
                declaraVar  cmd 'fim' {saida+="\n\n}\n}"; {saida+="//fimprog";}
                System.out.println(saida); 
};

declaraVar: (tab tipo VAR { x = new Variavel($VAR.text, tipo, escopo);
                        boolean ret = cv.adiciona(x);
                        if(!ret){
                            System.out.println("Variavel "+$VAR.text+" JA FOI DECLARADA.");
						    System.exit(0);
                        }} PV {saida+=$VAR.text+"; \n";}  )*  ;

tipo: tab ('inte' {tipo = 0; saida+="int ";} | 'chare' {tipo = 1; saida+="String ";} | 'double' {tipo = 2; saida+="double ";} ) ;

cmd: tab  (tab2 cmdAtrib |newLine tab2 cmdSe |newLine tab2 cmdFaca | newLine tab2 cmdPara |tab2 cmdEnquanto |newLine tab2 cmdLer |tab2 cmdImprimir | tab2 vpp pvNewLine |newLine  tab2 livraria)*; 
// { \n cmd \n}\n;
bloco: AC tab {saida+="\n";} cmd FC {saida+="\n";} ; 
pvNewLine: PV  {saida+="; \n";} ;
newLine: {saida+="\n";};
tab: {saida+="\t";} ;
tab2: {saida+="\t\t";} ;

//if(compara){cmd}else{cmd}
cmdSe: 'se' {saida+="if"; } AP {saida+="("; } compara FP {saida+="){"; } bloco  tab2 {saida+="}"; } //ver tabulação
        (('senao' {saida+="else"; } {saida+="{"; } bloco tab2 {saida+="}"; })
        | ('senaoSe' tab {saida+="else if"; } AP {saida+="("; } compara FP {saida+="){"; } bloco tab {saida+="}";} ) )* ;

//while(){cmd}; // enquanto (compara){cmd}
cmdEnquanto: 'enquanto' {saida+="while(";} AP compara FP {saida+="){";} bloco tab2 {saida+="}";} ;

//do{}while(); // faça {cmd} enquanto(compara);
cmdFaca: 'faça' {saida+="do{ ";} bloco 'enquanto' tab2 {saida+="}while(";} AP compara FP {saida+="); \n\n";} PV;

//for(i=0;compara;i++){bloco} // para(cont<-0; compara; cont++){bloco}
cmdPara: 'para' {saida+="for(";} AP atrib ';'{saida+=" ; ";} compara ';'{saida+=" ; ";} vpp FP {saida+="){";} bloco tab2 {saida+="}";} ; 
vpp: VAR {saida+=$VAR.text;} '<++' {saida+="++";}; 

compara: valor OP_REL {saida+=$OP_REL.text;} valor;

//ler(var).tipo
livraria: 'abrelivro>>' {saida+="Scanner sc = new Scanner(System.in);\n\n";} 
        | 'fechalivro>>' {saida+="sc.close();";};

cmdLer: 'ler'  AP valor FP '.' scan PV {saida+="\n"; } ; // 
scan:     'inte' {saida+=" = sc.nextInt();"; } 
        | 'chare' {saida+=" = sc.nextLine();"; } 
        | 'double'{saida+=" = sc.nextDouble();"; } ;

cmdImprimir: 'imprime' {saida+="System.out.println(";} AP valor ('+' {saida+="+";} valor)* FP {saida+="); ";} PV  ;

//VAR <- valor;
cmdAtrib: atrib pvNewLine ;
atrib: VAR {saida+=$VAR.text;} '<-' {saida+="=";}  valor { 
                        x = new Variavel($VAR.text, tipo, escopo);
                        boolean existe = cv.jaExiste($VAR.text);
                        if(!existe){
                            System.out.println("Variavel '"+$VAR.text+"' NAO DECLARADA.");
						    System.exit(0);
                        } }   ; //System.out.println($valor.text); //$valor.text funciona 

valor:   VAR {saida+=$VAR.text;} 
        | NUM {saida+=$NUM.int;}
        | DOUBLE {saida+=$DOUBLE.text;} 
        | TEXTO {saida+=$TEXTO.text;} 
        | valete {saida+=$valete.text;} //OPARIT {saida+=$OPARIT.text;} 
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
TEXTO: '"' (NUM| LETRAS | ' ' | ':' | '!' | '?' | '.'| '~' | ',' | '+' | '-' |'*' | '/' | AP | FP )+ '"';
OP_REL: '<' | '>' | '<=' | '>=' | '!=' | '==' ; //ver problema do espaço
PV: ';';
AP: '(';
FP: ')';
AC: '{';
FC: '}';
WS: [ \t\r\n]+ -> skip;