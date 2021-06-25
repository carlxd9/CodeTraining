console.log("IMC CALCULATOR");

function imcHTML(){
  var peso = document.getElementById('peso').value ;
  var alturaCm = document.getElementById('altura').value;
  var altura = alturaCm/100;

  var imc = peso/(altura*altura);

  document.getElementById('result').innerHTML = "Seu IMC é: " + imc.toFixed(2); //toFixed(2) limita os decimais para 2
  let classifica;
  if (peso || alturaCm != "") {
    if (imc < 17) {
      classifica = ">> Está MUITO ABAIXO do peso | Magreza Preocupante.";
    } else if (imc <= 18.49) {
      classifica = ">> Está ABAIXO do peso | Magreza.";
    } else if (imc <= 24.9) {
      classifica = ">> Está com peso NORMAL | Peso Saudável.";
    } else if (imc <= 29.9) {
      classifica = ">> Está Levemente ACIMA do peso | Sobrepeso.";
    } else if (imc <= 34.9) {
      classifica = ">> Está ACIMA do peso | Obesidade Grau I.";
    } else if (imc <= 39.9) {
      classifica = ">> Está MUITO ACIMA do peso | Obesidade Grau II (Severa).";
    } else { //40+
      classifica = ">> Está MUITÍSSIMO ACIMA do peso | Obesidade Grau III (Mórbida).";
    }
    document.getElementById('classificacao').innerHTML = classifica;
  } else {
    document.getElementById('result').innerHTML = "UM OU MAIS CAMPOS VAZIOS!"
    document.getElementById('classificacao').innerHTML = "POR FAVOR, PREENCHA TODOS OS CAMPOS.";
  }

}

//==================================================
function imcConsole() {
  var peso = prompt('Digite seu Peso: ');
  var alturaCm = prompt("Digite sua Altura(em centímetros): ");
  var altura = alturaCm/100;

  var imc = peso/(altura*altura);
  console.log("Seu IMC é: %.2f!", imc);

  if (peso || alturaCm == "") {
    if (imc < 17) {
      console.log(">> Está MUITO ABAIXO do peso | Magreza Preocupante.");
    } else if (imc <= 18.49) {
      console.log(">> Está ABAIXO do peso | Magreza.");
    } else if (imc <= 24.9) {
      console.log(">> Está com peso NORMAL | Peso Saudável.");
    } else if (imc <= 29.9) {
      console.log(">> Está Levemente ACIMA do peso | Sobrepeso.");
    } else if (imc <= 34.9) {
      console.log(">> Está ACIMA do peso | Obesidade Grau I.");
    } else if (imc <= 39.9) {
      console.log(">> Está MUITO ACIMA do peso | Obesidade Grau II (Severa).");
    } else { //40+
      console.log(">> Está MUITÍSSIMO ACIMA do peso | Obesidade Grau III (Mórbida).");
    }
  } else {
    alert('Um ou mais campos vazios! \nPreencha os campos que faltam e tente novamente!');
  }
}
