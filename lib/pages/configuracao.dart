import 'package:bootcamp_flutter/service/appStorage.dart';
import 'package:flutter/material.dart';

class Configuracao extends StatefulWidget {
  const Configuracao({super.key});

  @override
  State<Configuracao> createState() => _ConfiguracaoState();
}

class _ConfiguracaoState extends State<Configuracao> {
  final appStorage = AppStorage();
  TextEditingController usuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  bool receiveNotification = false;
  bool darkTheme = false;

  @override
  void initState() {
    restoreValues();
    super.initState();
  }

  void onChangeNotification(value) {
    setState(() {
      receiveNotification = value;
    });
  }

  void onChangeTheme(value) {
    setState(() {
      darkTheme = value;
    });
  }

  void restoreValues() async {
    darkTheme = await appStorage.getDarkTheme_Config() ?? false;
    receiveNotification = await appStorage.getNotification_Config() ?? false;

    usuarioController.text = await appStorage.getUsuario_Config();
    alturaController.text = (await appStorage.getAltura_Config()).toString();
    setState(() {});
  }

  void onSave() async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      await appStorage.setAltura_Config(double.parse(alturaController.text));
    } catch (e) {
      showAlert("Oops", "Favor informar uma altura válida");
    }
    await appStorage.setDarkTheme_Config(darkTheme);
    await appStorage.setNotification_Config(receiveNotification);

    await appStorage.setUsuario_Config(usuarioController.text);
    close();
  }

  void close() => Navigator.pop(context);

  void showAlert(String title, String message) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [TextButton(onPressed: () => close(), child: Text("Ok"))],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      body: Expanded(
          child: ListView(
        children: [
          TextField(
            controller: usuarioController,
            decoration: const InputDecoration(hintText: "nome de usuário"),
          ),
          TextField(
            controller: alturaController,
            decoration: const InputDecoration(hintText: "Altura"),
            keyboardType: TextInputType.number,
          ),
          SwitchListTile(
              title: const Text("Receber notificações"),
              value: receiveNotification,
              onChanged: onChangeNotification),
          SwitchListTile(
              title: const Text("Tema escuro"),
              value: darkTheme,
              onChanged: onChangeTheme),
          TextButton(onPressed: onSave, child: const Text("Salvo"))
        ],
      )),
    );
  }
}
