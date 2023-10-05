import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrasilFieldsPage extends StatefulWidget {
  const BrasilFieldsPage({super.key});

  @override
  State<BrasilFieldsPage> createState() => _BrasilFieldsPageState();
}

class _BrasilFieldsPageState extends State<BrasilFieldsPage> {
  var cepController = TextEditingController();
  var cpfController = TextEditingController();
  var centsController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BRASIL"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("CEP"),
            TextFormField(
              controller: cepController,
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
            ),
            const SizedBox(height: 15,),
            const Text("CPF"),
            TextFormField(
              controller: cpfController,
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
            ),
            const SizedBox(height: 15,),
            const Text("Centavos"),
            TextFormField(
              controller: centsController,
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                CentavosInputFormatter(moeda: true),
              ],
            ),
            const SizedBox(height: 20,),
            TextButton(onPressed: () {
              print("CPF: ${CPFValidator.isValid(cpfController.text)}");
              
            }, child: const Text("Validar"))

          ],
        ),
      ),
    );
  }
}
