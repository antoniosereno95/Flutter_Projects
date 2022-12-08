import 'package:flutter/material.dart';
import 'package:persistencia_de_dados_seriados_app/dataBase.dart';
import 'package:persistencia_de_dados_seriados_app/objetoSeriado.dart';

class listaSeriados extends StatefulWidget {
  const listaSeriados({super.key});

  @override
  State<listaSeriados> createState() => _listaSeriadosState();
}

class _listaSeriadosState extends State<listaSeriados> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Seriados Adicionados'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<objetoSeriado>>(
            future: handler.listSeriadosdoBD(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].nomeSeriado),
                      subtitle:
                          Text(snapshot.data![index].nomeServicodeStreaming),
                      leading: const Icon(Icons.movie),
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
