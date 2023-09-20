import 'package:bootcamp_flutter/models/ViaCepModel.dart';
import 'package:bootcamp_flutter/repository/viaCepRepository.dart';
import 'package:flutter/material.dart';

class ConsultaCepPage extends StatefulWidget {
  const ConsultaCepPage({super.key});

  @override
  State<ConsultaCepPage> createState() => _ConsultaCepPageState();
}

class _ConsultaCepPageState extends State<ConsultaCepPage> {
  TextEditingController cepController = TextEditingController();
  var viaCepModel = ViaCepModel();
  var repository = ViaCepRepository();
  bool loading = false;

  bool validateFields() {
    clearState();
    var cep = cepController.text;
    cep = cep.replaceAll(RegExp(r"[^0-9]"), "");

    if (cep.trim().length != 8) {
      return false;
    }
    return true;
  }

  void clearState() {
    setState(() {
      viaCepModel = ViaCepModel();
    });
  }

  Future<ViaCepModel?> consultarCep() async {
    setState(() {
      loading = true;
    });

    var result = await repository.consultarCep(cepController.text);    

    setState(() {
      loading = false;
    });   

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const Text("Consultar pelo cep"),
          TextField(
            controller: cepController,
            keyboardType: TextInputType.number,
            maxLength: 8,
          ),
          const SizedBox(height: 15),
          TextButton(
              onPressed: () async {
                if (validateFields()) {
                  var info = await consultarCep();
                  if (info != null) {
                    viaCepModel = info;
                  }
                }
              },
              child: const Text("Consultar")),
          Visibility(
              visible: loading, child: const CircularProgressIndicator()),
          Visibility(
              visible: viaCepModel.logradouro != null,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text("Rua: ${viaCepModel.logradouro ?? ""}"),
                  const SizedBox(height: 10),
                  Text("Estado: ${viaCepModel.uf ?? ""}"),
                  const SizedBox(height: 10),
                  Text("Estado: ${viaCepModel.localidade ?? ""}"),
                  const SizedBox(height: 10),
                ],
              ))
        ]),
      ),
    );
  }
}
