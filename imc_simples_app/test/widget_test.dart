import 'dart:io';

void main() {
  print('Calculadora de IMC (Índice de Massa Corporal)');
  stdout.write('Digite seu nome: ');
  final nome = stdin.readLineSync();

  stdout.write('Digite seu peso (em kg): ');
  final pesoStr = stdin.readLineSync();
  final peso = double.tryParse(pesoStr.toString());

  stdout.write('Digite sua altura (em metros): ');
  final alturaStr = stdin.readLineSync();
  final altura = double.tryParse(alturaStr.toString());

  if (nome == null || peso == null || altura == null) {
    print(
        'Dados inválidos. Certifique-se de digitar valores numéricos para peso e altura.');
  } else {
    final imc = calcularIMC(peso, altura);
    print('$nome, seu IMC é: $imc');
    interpretarIMC(imc);
  }
}

double calcularIMC(double peso, double altura) {
  return peso / (altura * altura);
}

void interpretarIMC(double imc) {
  if (imc < 18.5) {
    print('Abaixo do peso.');
  } else if (imc >= 18.5 && imc < 25) {
    print('Peso normal.');
  } else if (imc >= 25 && imc < 30) {
    print('Sobrepeso.');
  } else {
    print('Obesidade.');
  }
}
