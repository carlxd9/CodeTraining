import random, time

print("CARTELA DA SORTE - - - - - \n")
rifa = ['Regina','Débora','Tereza','Áurea','Elvira','Isabel','Margarida','Isaura','Selma','Dulce','Zoraide','Raquel','Adriana','Simone','Lourdes','Dolores','Roberta','Dirce','Norma','Daniela','Rosália','Joelma','Glória','Fátima','Zuleika','Jurema','Mônica','Helena','Eugênia','Adelaide','Denise','Jandira','Rosana','Valéria','Celeste','Olinda','Emília','Jaqueline','Adélia','Patrícia','Miriam','Clarice','Aurora','Lenice','Solange','Ivone','Márcia','Dora','Graziela','Maria']

resultado = ['O','nome','escolhido','foi:']
for i in resultado:
    print(i, flush=True, end=' ')  # end=' ' to keep printing in same line with a space in the end of print, if you do not flush=True, it will do a newline
    time.sleep(0.5)

print("\n")
print(random.choice(rifa))
print("\n")