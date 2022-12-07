import 'package:flutter/material.dart';

class MyHomePage2 extends StatelessWidget {
  String title;

  MyHomePage2({super.key, required this.title});

  //controladores dos campos de texto
  TextEditingController controllerNumero1 = TextEditingController();
  TextEditingController controllerNumero2 = TextEditingController();

  //resultado
  double? res;

  //controle logico dos botoes
  bool mais = false;
  bool menos = false;
  bool divide = false;
  bool mutiplica = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            //recebe primeiro numero
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                            color: Colors.black12, style: BorderStyle.solid)),
                    hintText: 'Primeiro numero'),
                controller: controllerNumero1,
                style: const TextStyle(fontSize: 20.0),
              ),
            ),

            //botoes em linha
            Row(
              children: [
                //botoes
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: () {
                      mais = true;
                      menos = false;
                      divide = false;
                      mutiplica = false;
                    },
                    child: const Text(" + "),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: () {
                      mais = false;
                      menos = true;
                      divide = false;
                      mutiplica = false;
                    },
                    child: const Text(" - "),
                  ),
                ), //botoes
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: () {
                      mais = false;
                      menos = false;
                      divide = false;
                      mutiplica = true;
                    },
                    child: const Text(" * "),
                  ),
                ),
                //botoes
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: () {
                      mais = false;
                      menos = false;
                      divide = true;
                      mutiplica = false;
                    },
                    child: const Text(" / "),
                  ),
                ),
              ],
            ),

            //recebe segundo numero
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                            color: Colors.black12, style: BorderStyle.solid)),
                    hintText: 'Segundo numero'),
                controller: controllerNumero2,
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
            //botao de igual
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                onPressed: () {
                  if (mais = true) {
                    res = double.parse(controllerNumero1.text) +
                        double.parse(controllerNumero2.text);
                  } else if (menos = true) {
                    res = double.parse(controllerNumero1.text) -
                        double.parse(controllerNumero2.text);
                  } else if (divide = true) {
                    res = double.parse(controllerNumero1.text) /
                        double.parse(controllerNumero2.text);
                  } else if (mutiplica = true) {
                    res = double.parse(controllerNumero1.text) *
                        double.parse(controllerNumero2.text);
                  }

                  //aftermath
                  mais = false;
                  menos = false;
                  divide = true;
                  mutiplica = false;
                  controllerNumero1.text = "";
                  controllerNumero2.text = "";
                },
                child: const Text(" = "),
              ),
            ),
            Text("resultado $res")
          ],
        ),
      )),
    );
  }
}