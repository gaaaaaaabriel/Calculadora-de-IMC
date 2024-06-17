import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var infoTexto = "IMC";
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  Widget buildTextField(String label, TextEditingController controlador) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle:
            TextStyle(color: Color.fromRGBO(85, 107, 47, 1), fontSize: 20.0),
        border: OutlineInputBorder(),
      ),
      style: TextStyle(color: Color.fromRGBO(85, 107, 47, 1)),
      keyboardType: TextInputType.number,
      controller: controlador,
    );
  }

  //Função para atualizar a tela, ela foi chamada
  // pelo botão --> 'IconButton', linha 86.
  void resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      infoTexto = "IMC";
    });
  }

  //Função para calcular o IMC, ela foi chamada pelo
  // botão 'Verificar' -->(ElevatedButton) linha 112.
  void calculate() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weight / (height * height);

    setState(() {
      if (imc < 16.9) {
        infoTexto = "Muito abaixo do peso! (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 17 && imc <= 18.49) {
        infoTexto = "Você esta abaíxo do peso!(${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.5 && imc <= 24.99) {
        infoTexto = "O seu peso é ideal/normal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 25 && imc <= 29.99) {
        infoTexto = "Voce esta acíma do peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 30 && imc <= 34.99) {
        infoTexto = "Obesidade tipo I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 35 && imc <= 39.99) {
        infoTexto =
            "Obesidade tipo II (Severa) (${imc.toStringAsPrecision(4)})";
      } else if (imc > 40) {
        infoTexto =
            "Obesidade tipo III (Morbida) (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(85, 107, 47, 1),
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              resetFields();
              //Aqui eu devo chaamar a função pra atualizar.
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.person_outline,
              size: 170.0,
              color: Color.fromRGBO(85, 107, 47, 1),
            ),
            buildTextField("Peso", weightController),
            Divider(),
            buildTextField("Altura", heightController),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                child: ElevatedButton(
                  child: Text(
                    "Verificar",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                  onPressed: () {
                    calculate();
                    // logica aqui de verificação
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromRGBO(85, 107, 47, 1), // Cor de fundo do botão
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                infoTexto,
                style: TextStyle(
                    color: Color.fromRGBO(85, 107, 47, 1), fontSize: 25.0),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
