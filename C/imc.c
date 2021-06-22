#include<stdlib.h>
#include<stdio.h>
#include<conio.h>
#include<locale.h>

int main(int argc, char const *argv[]) {
  setlocale( LC_ALL, "Portuguese");

  int peso;
  float imc, altura = 0.0;
  printf("digite aqui seu peso: "); scanf("%d", &peso);
  //printf("%d\n", peso);
  printf("digite aqui sua altura(com vírgula): "); scanf("%f", &altura);
  //printf("%.2f\n", altura);

  altura = altura*altura;
  imc = peso / altura;

  printf("\nSeu IMC é: %.2f \n\n", imc);

  system("pause");
  return 0;
}
