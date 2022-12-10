import 'package:flutter/material.dart';
import 'package:projeto_atividade_3_qualificacao_flutter/Gastos.dart';
import 'package:projeto_atividade_3_qualificacao_flutter/dataBase.dart';
import 'package:projeto_atividade_3_qualificacao_flutter/secondPage.dart';

class updatePage extends StatefulWidget {
  const updatePage({super.key, this.title, required this.id_antigo});

  final String? title;
  final int id_antigo;

  @override
  State<updatePage> createState() => _updatePage();
}

class _updatePage extends State<updatePage> {
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
        title: const Text("Editar"),
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

              //botao de comfirmar Updade
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    //aqui eu crio um objeto com os controllers e coloco na handler.update
                    if (widget.id_antigo != null) {
                      GastoOb gob = GastoOb(
                          id: widget.id_antigo,
                          valor: double.parse(controllerValor.text),
                          descricao: controllerDescricao.text,
                          categoria: controllerCategoria.text);

                      handler.updateNoDB(gob);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const SecondPage())));
                       print("O update correto id no gasto_antigo nullo");        
                    } else {
                      print("O update deu errado, id no gasto_antigo nullo");
                    }
                  },
                  child: const Text("Confirmar Edição"),
                ),
              )
            ],
          ),
        ),
      ),
      //botoes de cancelar
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const SecondPage())));
        },
        tooltip: 'vai pra segunda pagina',
        child: const Icon(Icons.cancel),
      ),
    );
  }
}
