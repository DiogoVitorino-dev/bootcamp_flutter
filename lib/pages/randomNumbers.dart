import 'package:bootcamp_flutter/models/random.dart';
import 'package:bootcamp_flutter/repositories/repositoryRandom.dart';
import 'package:bootcamp_flutter/service/generateRandom.dart';
import 'package:flutter/material.dart';

class RandomNumbers extends StatefulWidget {
  const RandomNumbers({super.key});

  @override
  State<RandomNumbers> createState() => _RandomNumbersState();
}

class _RandomNumbersState extends State<RandomNumbers> {
  var model = RandomModel.vazio();
  final repository = RepositoryRandom.create();

  void onSave() async {
    await repository.save(model);
  }

  void initFields() {
    setState(() {
			model = repository.restore();
		});
  }

  @override
  void initState() {
    initFields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerar números aleatórios"),
      ),
      body: Column(
        children: [
          Text(
            model.randomNumber.toString(),
            style: const TextStyle(fontSize: 26),
          ),
          Text(
            model.quantityNum.toString(),
            style: const TextStyle(fontSize: 26),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              model.randomNumber = GenerateRandom.generate(100);
              model.quantityNum++;
            });
            onSave();
          },
          child: const Icon(Icons.shuffle)),
    );
  }
}
