import 'package:flutter/material.dart';
import 'package:persistencia_de_dados_seriados_app/dataBase.dart';
import 'package:persistencia_de_dados_seriados_app/listaSeriados.dart';
import 'package:persistencia_de_dados_seriados_app/objetoSeriado.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //controladores de texto
  TextEditingController controllerSeriado = TextEditingController();
  TextEditingController controllerServicodeStreaming = TextEditingController();

  //instancia do controlador de banco de dados
  DataBaseHandler handler = DataBaseHandler();

  void qualquerCoisa() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Seriados - Modulo 2"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              //primeira entrada de dados Seriado
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                                color: Colors.deepOrange,
                                style: BorderStyle.solid)),
                        hintText: "Seriado"),
                    controller: controllerSeriado,
                    style: const TextStyle(fontSize: 20.0),
                  )),

              //segunda entrada de dados Servico de Streaming
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                                color: Colors.deepOrange,
                                style: BorderStyle.solid)),
                        hintText: "Serviço de Streaming"),
                    controller: controllerServicodeStreaming,
                    style: const TextStyle(fontSize: 20.0),
                  )),

              //botao de Salvar na lista
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    //colocar pra salvar os dados no BD
                    // ignore: unnecessary_new
                    objetoSeriado ob = new objetoSeriado(
                        //crio o meu novo objeto com as infor,açoes colocadas pleo ususario
                        nomeSeriado: controllerSeriado.text.toString(),
                        nomeServicodeStreaming:
                            controllerServicodeStreaming.text.toString());
                    //aqui eu coloco no BD com o insert
                    handler.insertnoBD(ob);

                    //limpa os textField
                    controllerSeriado.text = "";
                    controllerServicodeStreaming.text = "";
                  },
                  child: const Text("Adicionar a Lista"),
                ),
              )
            ],
          ),
        ),
      ),

      //botao flutuande de troca de pagina
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const listaSeriados(),
              ));
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
