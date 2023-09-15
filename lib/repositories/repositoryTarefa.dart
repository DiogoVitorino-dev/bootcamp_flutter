import 'package:bootcamp_flutter/database/databaseSqlite.dart';
import 'package:bootcamp_flutter/database/models/TarefaModelDB.dart';

class RepositoryTarefa {
  Future<List<TarefaModelDB>> getAll({bool? apenasNaoConcluidos}) async {
    var db = await DatabaseSQLITE.getInstance();
    var queryResult = await db.rawQuery(
			apenasNaoConcluidos == true
			? "SELECT * FROM tarefas WHERE concluido = 0"
			: "SELECT * FROM tarefas"
		);

    return queryResult.map((element) {
      return TarefaModelDB(int.parse(element["id"].toString()),
          element["concluido"] == 1, element["descricao"].toString());
    }).toList();
  }

  Future<void> add(TarefaModelDB tarefa) async {
    var db = await DatabaseSQLITE.getInstance();
    await db.rawInsert("INSERT INTO tarefas (concluido,descricao) values(?,?)",
        [tarefa.concluido, tarefa.descricao]);
  }

  Future<void> update(TarefaModelDB tarefa) async {
    var db = await DatabaseSQLITE.getInstance();
    await db.rawUpdate(
        "UPDATE tarefas SET descricao = ?, concluido = ? WHERE id = ?",
        [tarefa.descricao, tarefa.concluido, tarefa.id]);
  }

  Future<void> delete(int id) async {
    var db = await DatabaseSQLITE.getInstance();
    await db.rawDelete("DELETE FROM tarefas WHERE id = ?", [id]);
  }
}
