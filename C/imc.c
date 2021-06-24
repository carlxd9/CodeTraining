#include<stdlib.h>
#include<stdio.h>
#include<conio.h>
#include<locale.h>

int main(int argc, char const *argv[]) {
  setlocale( LC_ALL, "Portuguese");

  int peso;
  float imc, altura = 0.0;
  printf("digite aqui seu peso: "); scanf("%d", &peso);
  printf("digite aqui sua altura(com vírgula): "); scanf("%f", &altura);

  imc = peso / (altura*altura);

  printf("\nSeu IMC é: %.2f \n", imc);

  if (imc<17) {
    printf("Está MUITO ABAIXO do peso | Magreza Preocupante.\n\n");
  } else if (imc<=18.49) {
    printf("Está ABAIXO do peso | Magreza .\n\n");
  } else if(imc<=24.9){
    printf("Está com peso NORMAL | Saudável.\n\n");
  } else if(imc<=29.9){
    printf("Está Levemente ACIMA do peso | Sobrepeso.\n\n");
  } else if (imc<=34.9) {
    printf("Está ACIMA do peso | Obesidade Grau I.\n\n");
  } else if (imc<=39.9) {
    printf("Está MUITO ACIMA do peso | Obesidade Grau II (Severa).\n\n");
  } else { // imc 40++
    printf("Está MUITÍSSIMO ACIMA do peso | Obesidade Grau III (Mórbida).\n\n");
  }

  system("pause");

  return 0;
}
