import 'package:bootcamp_flutter/models/tarefaModel.dart';
import 'package:bootcamp_flutter/repositories/repositoryTarefa.dart';
import 'package:flutter/material.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var repository = RepositoryTarefa.create();
  TextEditingController descController = TextEditingController();
  final List<TarefaModel> _tarefas = [];
  bool listaNaoConcluidos = false;

  void getTarefas() {
    setState(() {
			if(listaNaoConcluidos) {
      	_tarefas.setAll(0, repository.restore(listaNaoConcluidos: listaNaoConcluidos));
			}
      _tarefas.setAll(0, repository.restore());
    });
  }

  Future<void> initFields() async {
    repository = await RepositoryTarefa.load();
  }

  @override
  void initState() {
    initFields();
    getTarefas();
    super.initState();
  }

  Future<void> onSave() async {
    getTarefas();
    await repository.save(TarefaModel(false, descController.text));
  }

  Future<void> onUpdate(TarefaModel model) async {
    getTarefas();
    await repository.update(model);
  }

	Future<void> onDelete(TarefaModel model) async {
    getTarefas();
    await repository.delete(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          descController.text = "";
          showDialog(
            context: context,
            builder: (BuildContext bc) {
              return AlertDialog(
                title: const Text("Adicionar Tarefa"),
                content: TextField(controller: descController),
                actions: [
                  TextButton(
                      onPressed: () {
                        onSave();
                        Navigator.pop(context);
                      },
                      child: const Text("Salvar")),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancelar"))
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Apenas não concluídos",
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  value: false,
                  onChanged: (value) {
                    setState(() {
                      listaNaoConcluidos = value;
                    });
                  },
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (BuildContext bc, int index) {
                  var tarefa = _tarefas[index];
                  return Dismissible(
                    key: Key(tarefa.key),
                    onDismissed: (direction) async {
                      onDelete(tarefa);
                    },
                    child: ListTile(
                      title: Text(tarefa.descricao),
                      trailing: Switch(
                        value: tarefa.concluido,
                        onChanged: (value) {
                          tarefa.concluido = value;
                          onUpdate(tarefa);
                          getTarefas();
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
