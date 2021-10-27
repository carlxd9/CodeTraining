# ANTLR4 Compiler
This is a pseudo-code to Java Compiler exemple.
- --

### Before all
To compile any ANTLR4 grammar you'll need the batch files and the .jar binaries:
- "<a href="https://github.com/carlxd9/CodeTraining/blob/master/Java/Compilador/antlr4.bat">antlr.bat</a>", "<a href="https://github.com/carlxd9/CodeTraining/blob/master/Java/Compilador/grun.bat">grun.bat</a>" in my case. (For binaries I'm using version 4.9.2, but you can get it <a href="https://www.antlr.org/download/antlr-4.9.2-complete.jar" target="_blank">here</a>). 
> Any doubt about these you can check in  <a href="https://github.com/antlr/antlr4/blob/master/doc/getting-started.md#windows" target="_blank">ANTLR4 documentation</a>.

### To run it in cmd/powershell:
```
antlr4 carlos.g4
javac *.java
grun carlos init imc.txt 
//to compile and read the pseudo code
```
<b>Will not work if you has an alredy compiled Saida.java in same folder. Delete it and try again.</b>

```
grun carlos init imc.txt //to read only the pseudo code
```

> use carlos_grammar.g4 as reference to how the main grammar works.

To save as .java just run the above command and add: ```>>Saida.java```
It will save the new translated program as java file (the one you must delete if you need to compile again).
> <i>The java file must be saved as "Saida.java" to run because the main class name is also called Saida.</i>
- --