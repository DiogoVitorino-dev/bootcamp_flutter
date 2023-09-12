import 'package:bootcamp_flutter/repositories/repositoryDataUser.dart';
import 'package:bootcamp_flutter/service/appStorage.dart';
import 'package:bootcamp_flutter/shared/widgets/textLabel.dart';
import 'package:flutter/material.dart';

class Dados extends StatefulWidget {
  const Dados({super.key});

  @override
  State<Dados> createState() => _DadosState();
}

class _DadosState extends State<Dados> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nomeController = TextEditingController(text: "");
    TextEditingController dataNascController = TextEditingController(text: "");

    DateTime? selectedDate;

    List<String> niveis = [];
    var selectedNivel = "";

    List<String> programLin = [];
    List<String> selectedProgramLin = [];

    int tempoExp = 0;

    double selectedSalario = 0;

    RepositoryDataUser repo = RepositoryDataUser();

    final appStorage = AppStorage();

    bool loading = false;

    void onSave() async {
      await appStorage.setNome_Cadastro(nomeController.text);
      await appStorage.setDataNasc_Cadastro(selectedDate!);
      await appStorage.setSalario_Cadastro(selectedSalario);
      await appStorage.setLinguagemPref_Cadastro(selectedProgramLin);
      await appStorage.setNivel_Cadastro(selectedNivel);
      await appStorage.setExperiencia_Cadastro(tempoExp);
    }

    void initFields() {
      setState(() {
        nomeController.text = appStorage.getNome_Cadastro();
        selectedDate = appStorage.getDataNasc_Cadastro();
        selectedSalario = appStorage.getSalario_Cadastro();
        selectedProgramLin = appStorage.getLinguagemPref_Cadastro();
        selectedNivel = appStorage.getNivel_Cadastro();
        tempoExp = appStorage.getExperiencia_Cadastro();
      });
    }

    List<DropdownMenuItem<int>> generateList() {
      List<DropdownMenuItem<int>> items = [];
      for (var i = 0; i <= 50; i++) {
        items.add(DropdownMenuItem(
          value: i,
          child: Text(i.toString()),
        ));
      }
      return items;
    }

    void validationFields() {
      try {
        if (nomeController.text.trim().length < 3) {
          throw "Nome deve ser preenchido";
        } else if (selectedDate == null) {
          throw "Data de nascimento inválida";
        } else if (selectedNivel.trim().isEmpty) {
          throw "O nível deve ser selecionado";
        } else if (selectedProgramLin.isEmpty) {
          throw "Deve ser selecionado ao menos uma linguagem preferida";
        }
      } catch (err) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(err.toString())));
      }
    }

    @override
    void initState() {
      initFields();
      niveis = repo.getNiveis();
      programLin = repo.getLinguagemProgramacao();

      super.initState();
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Meus dados")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: loading == true
            ? const CircularProgressIndicator()
            : ListView(
                children: [
                  const TextLabel(texto: "Nome"),
                  TextField(controller: nomeController),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextLabel(texto: "Data de Nascimento"),
                  TextField(
                    controller: dataNascController,
                    readOnly: true,
                    onTap: () async {
                      var data = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2004, 1, 1),
                          firstDate: DateTime(1970, 1, 1),
                          lastDate: DateTime.now());

                      if (data != null) {
                        dataNascController.text = data.toLocal().toString();
                        selectedDate = data;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextLabel(texto: "Nível de experiência"),
                  Column(
                    children: niveis
                        .map((nivel) => RadioListTile(
                            title: Text(nivel),
                            dense: true,
                            selected: nivel == selectedNivel,
                            value: nivel,
                            groupValue: nivel,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  selectedNivel = value;
                                }
                              });
                            }))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextLabel(texto: "Linguagens preferidas"),
                  Column(
                    children: programLin
                        .map((lin) => CheckboxListTile(
                              title: Text(lin),
                              dense: true,
                              value: selectedProgramLin.contains(lin),
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    selectedProgramLin.add(lin);
                                  } else {
                                    selectedProgramLin.remove(lin);
                                  }
                                });
                              },
                            ))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextLabel(texto: "Tempo de experiência"),
                  DropdownButton(
                    value: tempoExp,
                    items: generateList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) {
                          tempoExp = value;
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextLabel(
                      texto:
                          "Pretensão Salarial: R\$ ${selectedSalario.toStringAsFixed(2)}"),
                  Slider(
                    value: selectedSalario,
                    min: 0,
                    max: 10000,
                    onChanged: (value) {
                      setState(() {
                        selectedSalario = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          loading = false;
                        });

                        setState(() {
                          loading = true;
                        });
                        validationFields();
                        onSave();

                        Future.delayed(
                          const Duration(seconds: 2),
                          () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Salvo com sucesso!")));
                            setState(() {
                              loading = false;
                            });

                            Navigator.pop(context);
                          },
                        );
                      },
                      child: const Text("Salvar"))
                ],
              ),
      ),
    );
  }
}
