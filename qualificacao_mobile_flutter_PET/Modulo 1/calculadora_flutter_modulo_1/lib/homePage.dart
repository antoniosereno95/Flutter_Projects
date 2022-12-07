import 'package:calculadora_flutter_modulo_1/secondPage.dart';
import 'package:flutter/material.dart';

import 'op.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //controladores dos campos de texto
  TextEditingController controllerNumero1 = TextEditingController();
  TextEditingController controllerNumero2 = TextEditingController();

  //resultado
  double? res;

  //lista de resultados
  List<op> values = [];

  void mais1() {
    setState(() {
      res = double.parse(controllerNumero1.text) +
          double.parse(controllerNumero2.text);
    });
  }

  void menos1() {
    setState(() {
      res = double.parse(controllerNumero1.text) -
          double.parse(controllerNumero2.text);
    });
  }

  void divide1() {
    setState(() {
      res = double.parse(controllerNumero1.text) /
          double.parse(controllerNumero2.text);
    });
  }

  void mutiplica1() {
    setState(() {
      res = double.parse(controllerNumero1.text) *
          double.parse(controllerNumero2.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      mais1();
                      String frase = "${controllerNumero1.text} + ${controllerNumero2.text}";
                      op p = op(operacao: frase, resultado: res.toString());
                      values.add(p);
                    },
                    child: const Text(" + "),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      menos1();
                      String frase = "${controllerNumero1.text} - ${controllerNumero2.text}";
                      op p = op(operacao: frase, resultado: res.toString());
                      values.add(p);
                    },
                    child: const Text(" - "),
                  ),
                ), //botoes
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      mutiplica1();
                      String frase = "${controllerNumero1.text} * ${controllerNumero2.text}";
                      op p = op(operacao: frase, resultado: res.toString());
                      values.add(p);
                    },
                    child: const Text(" * "),
                  ),
                ),
                //botoes
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      divide1();
                      String frase = "${controllerNumero1.text} / ${controllerNumero2.text}";
                      op p = op(operacao: frase, resultado: res.toString());
                      values.add(p);
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
            //mostra resultado
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(res.toString()),
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => secondPage4(
                        values: values,
                      )));
        },
        child: const Icon(Icons.navigate_next_rounded),
      ),
    );
  }
}
