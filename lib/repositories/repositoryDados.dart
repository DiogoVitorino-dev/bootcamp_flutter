import 'package:bootcamp_flutter/models/dadosModel.dart';
import 'package:hive/hive.dart';

enum REPOSITORY_KEYS {
  BOX_DADOS,
  NOME_KEY,
  DATANASC_KEY,
  NIVELPROG_KEY,
  LINPREFERENCIA_KEY,
  TEMPOEXP_KEY,
  SALARIO_KEY
}

class RepositoryDados {
  static late Box _box;

  RepositoryDados.create();

  static Future<RepositoryDados> load() async {
    if (!Hive.isBoxOpen(REPOSITORY_KEYS.BOX_DADOS.toString())) {
      _box = await Hive.openBox(REPOSITORY_KEYS.BOX_DADOS.toString());
    } else {
      _box = Hive.box(REPOSITORY_KEYS.BOX_DADOS.toString());
    }
    return RepositoryDados.create();
  }

  Future<void> save(DadosModel model) async {
    await _box.put(REPOSITORY_KEYS.BOX_DADOS.toString(), model);
  }

  DadosModel restore() {
    var restored = _box.get(REPOSITORY_KEYS.BOX_DADOS.toString());
    if (restored == null) {
      return DadosModel.vazio();
    } else {
      return DadosModel.create(restored.nome, restored.dataNasc, restored.nivelProg,
            restored.linPreferencia, restored.tempoExp, restored.salario);
    }
  }
}
