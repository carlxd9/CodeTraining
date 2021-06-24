#include<stdlib.h>
#include<stdio.h>
#include<conio.h>
#include<locale.h>

int main(int argc, char const *argv[]) {
  setlocale( LC_ALL, "Portuguese");

  int peso;
  float imc, altura = 0.0;
  printf("digite aqui seu peso: "); scanf("%d", &peso);
  printf("digite aqui sua altura(com v�rgula): "); scanf("%f", &altura);

  imc = peso / (altura*altura);

  printf("\nSeu IMC �: %.2f \n", imc);

  if (imc<17) {
    printf("Est� MUITO ABAIXO do peso | Magreza Preocupante.\n\n");
  } else if (imc<=18.49) {
    printf("Est� ABAIXO do peso | Magreza .\n\n");
  } else if(imc<=24.9){
    printf("Est� com peso NORMAL | Saud�vel.\n\n");
  } else if(imc<=29.9){
    printf("Est� Levemente ACIMA do peso | Sobrepeso.\n\n");
  } else if (imc<=34.9) {
    printf("Est� ACIMA do peso | Obesidade Grau I.\n\n");
  } else if (imc<=39.9) {
    printf("Est� MUITO ACIMA do peso | Obesidade Grau II (Severa).\n\n");
  } else { // imc 40++
    printf("Est� MUIT�SSIMO ACIMA do peso | Obesidade Grau III (M�rbida).\n\n");
  }

  system("pause");

  return 0;
}
