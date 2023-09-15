import 'package:hive/hive.dart';
part 'tarefaModel.g.dart';

@HiveType(typeId: 1)
class TarefaModel extends HiveObject {
  @HiveField(0)
  String descricao = "";
  @HiveField(1)
  bool concluido = false;

  TarefaModel.vazio();
  TarefaModel(this.concluido, this.descricao);
}
