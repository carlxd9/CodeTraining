# comentários devem ser 2 espaços após o código e 1 espaço após o '#'
'''
exemplo de
comentário em bloco
com 3 apóstrofes
'''
print("=======================================================")
print("\nCALCULADORA DE IMC\n")

peso = int(input('Digite seu Peso: '))

alturaCm = int(input('Agora digite sua altura(em cm): '))
altura = alturaCm/100  # conversão de cm para Metros

imc = peso/(altura*altura)

print("\nSeu IMC é: %.2f \n" % imc)

if imc < 17:
    print(">> Está MUITO ABAIXO do peso | Magreza Preocupante.\n")
elif imc <= 18.49:
    print(">> Está ABAIXO do peso | Magreza.\n")
elif imc <= 24.9:
    print(">> Está com peso NORMAL | Peso Saudável.\n")
elif imc <= 29.9:
    print(">> Está Levemente ACIMA do peso | Sobrepeso.\n")
elif imc <= 34.9:
    print(">> Está ACIMA do peso | Obesidade Grau I.\n")
elif imc <= 39.9:
    print(">> Está MUITO ACIMA do peso | Obesidade Grau II (Severa).\n")
else:
    print(">> Está MUITÍSSIMO ACIMA do peso | Obesidade Grau III (Mórbida).\n")
print("=======================================================")
