import 'package:bootcamp_flutter/models/tarefa.dart';
import 'package:bootcamp_flutter/repositories/repositoryTarefa.dart';
import 'package:flutter/material.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var tarefaRepository = RepositoryTarefa();
  TextEditingController descController = TextEditingController();
  final List<Tarefa> _tarefas = [];
  bool listaNaoConcluidos = false;

  void getTarefas() async {
    if (listaNaoConcluidos == true) {
      _tarefas.setAll(0, await tarefaRepository.listarTarefasNaoConcluidas());
    } else {
      _tarefas.setAll(0, await tarefaRepository.listarTarefas());
    }
    setState(() {});
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
                        tarefaRepository
                            .adicionar(Tarefa(false, descController.text));
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
                    key: Key(tarefa.id),
                    onDismissed: (direction) async {
                      await tarefaRepository.remover(tarefa.id);
                    },
                    child: ListTile(
                      title: Text(tarefa.descricao),
                      trailing: Switch(
                        value: tarefa.concluido,
                        onChanged: (value) {
                          tarefa.concluido = value;
                          tarefaRepository.alterar(tarefa);
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
