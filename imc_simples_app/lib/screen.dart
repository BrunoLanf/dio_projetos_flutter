import 'package:flutter/material.dart';

class CalcularIMC extends StatefulWidget {
  const CalcularIMC({Key? key}) : super(key: key);

  @override
  _CalcularIMCState createState() => _CalcularIMCState();
}

class _CalcularIMCState extends State<CalcularIMC> {
  TextEditingController nomeController = TextEditingController();
  double peso = 70.0;
  double altura = 1.70;
  String resultado = '';

  void _resposta(String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Seu resultado do IMC',
              style: TextStyle(fontSize: 20, color: Colors.black)),
          content: Text(mensagem),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: const Text(
                'Fechar',
                style: TextStyle(color: Color(0xFFEB1555)),
              ),
            ),
          ],
          backgroundColor: Colors.white,
        );
      },
    );
  }

  void calcularIMC() {
    final nome = nomeController.text;

    if (nome.isEmpty || peso <= 0 || altura <= 0) {
      setState(() {
        resultado = 'Dados inválidos. \nVerifique os campos.';
      });
      return;
    }

    final imc = peso / (altura * altura);
    String classificacao = '';

    if (imc < 16) {
      classificacao = 'Magreza grave';
    } else if (imc >= 16 && imc < 17) {
      classificacao = 'Magreza moderada';
    } else if (imc >= 17 && imc < 18.5) {
      classificacao = 'Magreza leve';
    } else if (imc >= 18.5 && imc < 25) {
      classificacao = 'Saudável';
    } else if (imc >= 25 && imc < 30) {
      classificacao = 'Sobrepeso';
    } else if (imc >= 30 && imc < 35) {
      classificacao = 'Obesidade Grau I';
    } else if (imc >= 35 && imc < 40) {
      classificacao = 'Obesidade Grau II';
    } else {
      classificacao = 'Obesidade Grau III';
    }

    setState(() {
      resultado = '$nome - IMC: ${imc.toStringAsFixed(2)} \n\n$classificacao';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFFEB1555),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'CALCULADORA DE IMC',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: 140,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 44, 46, 78),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'NOME',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(144, 255, 255, 255),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            maxLength: 25,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                            controller: nomeController,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.white)),
                              border: UnderlineInputBorder(),
                              hintText: 'ex: José',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(57, 255, 255, 255),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: 140,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 44, 46, 78),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'PESO',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(144, 255, 255, 255),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: peso.toInt().toString(),
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                              const TextSpan(
                                text: '   kg',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(144, 255, 255, 255)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Slider(
                          thumbColor: const Color(0xFFEB1555),
                          activeColor: Colors.white,
                          inactiveColor:
                              const Color.fromARGB(144, 255, 255, 255),
                          min: 5,
                          max: 200,
                          value: peso,
                          onChanged: (newValue) {
                            setState(() {
                              peso = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: 140,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 44, 46, 78),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'ALTURA',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(144, 255, 255, 255),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: altura.toStringAsFixed(2),
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                              const TextSpan(
                                text: '   cm',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(144, 255, 255, 255)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Slider(
                          thumbColor: const Color(0xFFEB1555),
                          activeColor: Colors.white,
                          inactiveColor:
                              const Color.fromARGB(144, 255, 255, 255),
                          min: 0.5,
                          max: 2.5,
                          value: altura,
                          onChanged: (double newValue) {
                            setState(() {
                              altura = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 70),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFEB1555)),
                      ),
                      onPressed: () {
                        calcularIMC();
                        _resposta(resultado);
                      },
                      child: const Text('CALCULAR IMC'),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF111328),
    );
  }
}
