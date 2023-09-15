class TarefaModelDB {
  int _id = 0;
  String _descricao = "";
  bool _concluido = false;

  TarefaModelDB.create(this._concluido, this._descricao);

	TarefaModelDB(this._id,this._concluido, this._descricao);

  int get id => _id;
  String get descricao => _descricao;
  bool get concluido => _concluido;

  set id(int id) => _id = id;

	set descricao(String descricao) => _descricao = descricao;

  set concluido(bool concluido) => _concluido = concluido;
}
