import random, time

print("CARTELA DA SORTE - - - - - \n")
rifa = ['Regina','Débora','Tereza','Áurea','Elvira','Isabel','Margarida','Isaura','Selma','Dulce','Zoraide','Raquel','Adriana','Simone','Lourdes','Dolores','Roberta','Dirce','Norma','Daniela','Rosália','Joelma','Glória','Fátima','Zuleika','Jurema','Mônica','Helena','Eugênia','Adelaide','Denise','Jandira','Rosana','Valéria','Celeste','Olinda','Emília','Jaqueline','Adélia','Patrícia','Miriam','Clarice','Aurora','Lenice','Solange','Ivone','Márcia','Dora','Graziela','Maria']

resultado = ['O','nome','escolhido','foi:']
for i in resultado:
    print(i, flush=True, end=' ')  # flush permite o end dentro do loop / end=" " pra não pular linha depois de executar 
    time.sleep(0.5)

print("\n")
print(random.choice(rifa))
print("\n")