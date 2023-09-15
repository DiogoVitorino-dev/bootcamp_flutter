import 'package:bootcamp_flutter/models/tarefaModel.dart';
import 'package:hive/hive.dart';

enum REPOSITORY_KEYS {
  BOX_TAREFA,
}

class RepositoryTarefa {
  static late Box _box;

  RepositoryTarefa.create();

  static Future<RepositoryTarefa> load() async {
    if (!Hive.isBoxOpen(REPOSITORY_KEYS.BOX_TAREFA.toString())) {
      _box = await Hive.openBox(REPOSITORY_KEYS.BOX_TAREFA.toString());
    } else {
      _box = Hive.box(REPOSITORY_KEYS.BOX_TAREFA.toString());
    }
    return RepositoryTarefa.create();
  }

  Future<void> save(TarefaModel model) async {
    await _box.add(model);
  }

  Future<void> update(TarefaModel model) async {
    await _box.put(model.key, model);
  }

  Future<void> delete(TarefaModel model) async {
    await _box.delete(model.key);
  }

  List<TarefaModel> restore({bool listaNaoConcluidos = false}) {
    if (listaNaoConcluidos == true) {
      return _box.values
          .cast<TarefaModel>()
          .where((element) => !element.concluido)
          .toList();
    }
    return _box.values.cast<TarefaModel>().toList();
  }
}
