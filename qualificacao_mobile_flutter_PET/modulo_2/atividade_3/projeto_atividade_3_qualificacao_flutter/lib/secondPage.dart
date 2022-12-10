import 'package:flutter/material.dart';
import 'package:projeto_atividade_3_qualificacao_flutter/Gastos.dart';
import 'package:projeto_atividade_3_qualificacao_flutter/dataBase.dart';
import 'package:projeto_atividade_3_qualificacao_flutter/homePage.dart';
import 'package:projeto_atividade_3_qualificacao_flutter/updatePage.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //controlador de BD
  DataBaseHandler handler = DataBaseHandler();

  @override
  void initState() {
    super.initState();
    handler.initializeDB().whenComplete(() {
      setState(() {
        handler.listSeriadosdoBD();
      });
    });
  }

  void posDeletar() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Gastos Cadastrados'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<GastoOb>>(
            future: handler.listSeriadosdoBD(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          snapshot.data![index].categoria), //titulo categoria
                      subtitle: Text(snapshot.data![index].valor
                          .toString()), //sub titulo valor dos gastos
                      leading: const Icon(Icons.money),
                      trailing: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //botao de Update/edit gasto ERRADOO!!!
                          ElevatedButton(
                              onPressed: () {
                                if (snapshot.data![index].id != null) {
                                  int idd = snapshot.data![index].id as int;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              updatePage(id_antigo: idd))));
                                }
                              },
                              child: const Text("Editar")),
                          //botao deletar entrada de gastos
                          ElevatedButton(
                              onPressed: () {
                                handler.deletaPorCategoria(
                                    snapshot.data![index].categoria);
                                posDeletar();

                                /*
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                            "Voce quer mesmo deletar isso?"),
                                        actions: <Widget>[
                                          // define os botões na base do dialogo
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                child: const Text("Sim"),
                                                onPressed: () {
                                                  handler.deletaPorCategoria(
                                                      snapshot.data![index].categoria);
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage())
                                                  );
                                                  
                                                },
                                              ),
                                              ElevatedButton(
                                                child: const Text("Não"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                      
                                    }
                                    );
                                */
                              },
                              child: const Text("Deletar"))
                        ],
                      ),
                      //mostrar a descriçao do gasto quando clicar encima dele la na lista
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(snapshot.data![index].descricao),
                                actions: <Widget>[
                                  // define os botões na base do dialogo
                                  ElevatedButton(
                                    child: const Text("Fechar"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                    );
                  },
                );
              } else {
                return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Text('Lista de Seriados Vazia')]),
                );
              }
            }),
      ),
    );
  }
}
