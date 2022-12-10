import 'package:flutter/material.dart';
import 'package:projeto_atividade_3_qualificacao_flutter/Gastos.dart';
import 'package:projeto_atividade_3_qualificacao_flutter/dataBase.dart';
import 'package:projeto_atividade_3_qualificacao_flutter/secondPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //meus controladores de texto da home page
  TextEditingController controllerCategoria = TextEditingController();
  TextEditingController controllerValor = TextEditingController();
  TextEditingController controllerDescricao = TextEditingController();

  //manipulador do banco de dados
  DataBaseHandler handler = DataBaseHandler();

  /*
  void qualquerCoisa() {
    setState(() {});
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atividade 3 - Controle Fiscal'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //primeira entrada de dados Categoria
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                                color: Colors.deepOrange,
                                style: BorderStyle.solid)),
                        hintText: "Categoria"),
                    controller: controllerCategoria,
                    style: const TextStyle(fontSize: 20.0),
                  )),

              //segunda entrada de dados valor
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                                color: Colors.deepOrange,
                                style: BorderStyle.solid)),
                        hintText: "Valor"),
                    controller: controllerValor,
                    style: const TextStyle(fontSize: 20.0),
                  )),

              //terceira entrada de dados Descrição
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                                color: Colors.deepOrange,
                                style: BorderStyle.solid)),
                        hintText: "Descrição"),
                    controller: controllerDescricao,
                    style: const TextStyle(fontSize: 20.0),
                  )),

              //botao de Salvar na lista
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    GastoOb gob = GastoOb(
                        valor: double.parse(controllerValor.text),
                        descricao: controllerDescricao.text,
                        categoria: controllerCategoria.text);
                    if(gob.id == null){
                      handler.insertnoBD(gob);
                    }
                   
                    controllerValor.text = "";
                    controllerDescricao.text = "";
                    controllerCategoria.text = "";
                    //
                  },
                  child: const Text("Adicionar Gasto a Lista"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  //botao para lista de gastos
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const SecondPage())));
                  },
                  child: const Text("Lista de Gastos"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  //botao para garficos
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const SecondPage())));
                  },
                  child: const Text("Graficos dos Gastos"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
