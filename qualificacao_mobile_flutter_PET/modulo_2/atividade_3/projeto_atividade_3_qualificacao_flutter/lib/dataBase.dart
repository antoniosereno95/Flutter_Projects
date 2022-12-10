import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:projeto_atividade_3_qualificacao_flutter/Gastos.dart';

class DataBaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'gastos.db'),
      //Android -> /sitcoms.db
      onCreate: (database, version) async {
        await database.execute(
            "CREATE TABLE gastos(id INTEGER PRIMARY KEY AUTOINCREMENT, valor DOUBLE NOT NULL , categoria TEXT NOT NULL, descricao TEXT NOT NULL)");
      },
      version: 1,
    );
  }

  //INSERT
  Future<void> insertnoBD(GastoOb gasto) async {
    final db = await initializeDB();
    await db.insert('gastos', gasto.toMap());
  }

  //SELECT/LIST/READ
  Future<List<GastoOb>> listSeriadosdoBD() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> result = await db.query('gastos');
    return List.generate(result.length, (index) {
      return GastoOb(
        valor: result[index]['valor'],
        categoria: result[index]['categoria'],
        descricao: result[index]['descricao'],
        id: result[index]['id'],
      );
    });
  }

  //DELETE
  /*
  Future<void> deletaPorNomedoDB(String nomeSeriado) async {
    
    final db = await initializeDB();
    await db
        .delete("gastos", where: "nomeSeriado = ?", whereArgs: [nomeSeriado]);
  }
  */
  Future<int> deletaPorIDdoDB(int id) async {
    final db = await initializeDB();
    int res = await db.delete("gastos", where: "id = ?", whereArgs: [id]);
    return res;
  }

  Future<int> deletaPorCategoria(String categoria) async {
    final db = await initializeDB();
    int res = await db
        .delete("gastos", where: "categoria = ?", whereArgs: [categoria]);
    return res;
  }

  //UPDATE
  Future<void> updateNoDB(GastoOb novoGasto) async {
    final db = await initializeDB();

    await db
        .update("gastos", novoGasto.toMap(), where: "id = ?", whereArgs: [novoGasto.id]);
  }
}
