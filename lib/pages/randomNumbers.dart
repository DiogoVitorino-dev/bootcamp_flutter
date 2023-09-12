import 'package:bootcamp_flutter/service/appStorage.dart';
import 'package:bootcamp_flutter/service/generateRandom.dart';
import 'package:flutter/material.dart';

class RandomNumbers extends StatefulWidget {
  const RandomNumbers({super.key});

  @override
  State<RandomNumbers> createState() => _RandomNumbersState();
}

class _RandomNumbersState extends State<RandomNumbers> {
  int num = 0;
  int quantityNum = 0;
  final appStorage = AppStorage();


  void onSave() async {
    await appStorage.setRandomNumber_Random(num);
    await appStorage.setQuantity_Random(quantityNum);
  }

  void initFields() async {
    setState(() {
      num = appStorage.getRandomNumber_Random();
      quantityNum = appStorage.getQuantity_Random();
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
            num.toString(),
            style: const TextStyle(fontSize: 26),
          ),
					Text(
            quantityNum.toString(),
            style: const TextStyle(fontSize: 26),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              num = GenerateRandom.generate(100);
              quantityNum++;
            });
            onSave();
          },
          child: const Icon(Icons.shuffle)),
    );
  }
}