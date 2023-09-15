import 'package:bootcamp_flutter/models/tarefa.dart';

class RepositoryTarefaList {
  List<Tarefa> _tarefas = [];

  Future<void> adicionar(Tarefa tarefa) async {await Future.delayed(const Duration(seconds: 1)); _tarefas.add(tarefa);}

  Future<void> remover(String id) async {
		await Future.delayed(const Duration(seconds: 1));
		_tarefas.removeWhere((tarefa) => tarefa.id == id);
	}
  Future<void> alterar(Tarefa tarefa) async {
		await Future.delayed(const Duration(seconds: 1));
		_tarefas.map(
		(oldTarefa) => oldTarefa.id == tarefa.id ? tarefa : oldTarefa,
	);}
  Future<Tarefa> buscar(String descricao) async{
		await Future.delayed(const Duration(seconds: 1));
		return _tarefas.where(
			(tarefa) => RegExp("$descricao*").hasMatch(tarefa.descricao)
		).first;
	}

  Future<List<Tarefa>> listarTarefas() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tarefas;
  }

	Future<List<Tarefa>> listarTarefasNaoConcluidas() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tarefas.where((tarefas) => !tarefas.concluido).toList();
  }
}
