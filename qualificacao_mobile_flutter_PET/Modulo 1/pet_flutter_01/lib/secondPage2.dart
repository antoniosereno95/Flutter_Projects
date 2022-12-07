/*
import 'package:flutter/material.dart';
import 'package:pet_flutter_01/pessoa.dart';

class SecondPage2 extends StatefulWidget {
  const SecondPage2({super.key, required this.valores});

  final List<Pessoa> valores;

  @override
  State<SecondPage2> createState() => _SecondPage2State();
}

class _SecondPage2State extends State<SecondPage2> {
  
 var values;

  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Second Page 2")),
      body: ListView.builder(
        itemCount: values.length,
        itemBuilder: (context, index) {
            
        }
        ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:pet_flutter_01/pessoa.dart';


class SecondPage2 extends StatelessWidget {
  const SecondPage2({super.key, required this.values});

  final List<Pessoa> values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: ListView.builder(
          itemCount: values.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(values[index].nome),
                            // ignore: prefer_const_constructors
                            content: Text("IMC: " + values[index].calculaIMC().toString() + " - Situação: "+ values[index].situacaoIMC()),
                            actions: <Widget>[
                              FloatingActionButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Ok"))
                            ],
                          );
                        });
                  },
                  child: ListTile(
                    title:
                        Text("${values[index].nome}, ${values[index].idade}"),
                    subtitle: Text(
                        "Peso: ${values[index].peso}  Altura: ${values[index].altura}"),
                    //leading: Icon(Icons),
                  ),
                ));
          }),
    );
  }
}
