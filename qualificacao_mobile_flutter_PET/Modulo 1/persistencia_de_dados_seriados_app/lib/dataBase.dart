import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:persistencia_de_dados_seriados_app/objetoSeriado.dart';

class DataBaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'seriados.db'),
      //Android -> /sitcoms.db
      onCreate: (database, version) async {
        await database.execute(
            "CREATE TABLE seriados(id INTEGER PRIMARY KEY AUTOINCREMENT, nomeSeriado TEXT NOT NULL, nomeServicodeStreaming TEXT NOT NULL)");
      },
      version: 1,
    );
  }

  //INSERT
  Future<void> insertnoBD(objetoSeriado seriado) async {
    final db = await initializeDB();
    await db.insert('seriados', seriado.toMap());
  }

  //SELECT/LIST/READ
  Future<List<objetoSeriado>> listSeriadosdoBD() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> result = await db.query('seriados');
    return List.generate(result.length, (index) {
      return objetoSeriado(
        nomeSeriado: result[index]['nomeSeriado'],
        nomeServicodeStreaming: result[index]['nomeServicodeStreaming'],
      );
    });
  }

  //DELETE
  Future<void> deletaPorNomedoDB(String nomeSeriado) async {
    
    final db = await initializeDB();
    await db
        .delete("seriados", where: "nomeSeriado = ?", whereArgs: [nomeSeriado]);
  }

  Future<void> deletaPorIDdoDB(int id) async {
    
    final db = await initializeDB();
    await db.delete("seriados", where: "id = ?", whereArgs: [id]);
  }

  //UPDATE
  Future<void> updateNoDB(int id, objetoSeriado novoObjeto) async {
    
    final db = await initializeDB();

    await db.update("seriados", novoObjeto.toMap(),
        where: "id = ?", whereArgs: [id]);
  }
}
