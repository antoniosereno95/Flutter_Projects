import 'package:flutter/material.dart';
import 'package:pet_flutter_01/pessoa.dart';
import 'package:pet_flutter_01/secondPage.dart';
import 'package:pet_flutter_01/secondPage2.dart';

class HomePage extends StatefulWidget {
  //isso aqui embaixo é o construtor
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //aqui eu declaro os botoes que vou usar e no scafold eu modelo os botoes
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerIdade = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  TextEditingController controllerPeso = TextEditingController();

  List<Pessoa> pessoas = [];

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                              color: Colors.cyan, style: BorderStyle.solid)),
                      hintText: "Nome"),
                  controller: controllerNome,
                ),
              ), //nome

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                              color: Colors.cyan, style: BorderStyle.solid)),
                      hintText: "Idade"),
                  controller: controllerIdade,
                ),
              ), //idade

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                              color: Colors.cyan, style: BorderStyle.solid)),
                      hintText: "Altura (Metros)"),
                  controller: controllerAltura,
                ),
              ), //altura

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                              color: Colors.cyan, style: BorderStyle.solid)),
                      hintText: "Peso (KG)"),
                  controller: controllerPeso,
                ),
              ), //peso

              ElevatedButton(
                  onPressed: () {
                    Pessoa p = Pessoa(
                        nome: controllerNome.text,
                        idade: int.parse(controllerIdade.text),
                        peso: double.parse(controllerPeso.text),
                        altura: double.parse(controllerAltura.text));
                        
                    pessoas.add(p); //aqui eu salvo as informaçoes na lista

                    controllerNome.text = "";
                    controllerIdade.text = "";
                    controllerPeso.text = "";
                    controllerAltura.text =
                        ""; //com essas 4 linha seu apago oq o usuario havia escrito nos TextField, logo depois dele acionar o botão "salvar"
                  },
                  child: const Text("Salvar")),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => SecondPage2(values: pessoas)
                )
                );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.navigate_next_outlined, color: Colors.white),
      ),
    );
  }
}


