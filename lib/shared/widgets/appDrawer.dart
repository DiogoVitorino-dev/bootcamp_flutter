import 'package:bootcamp_flutter/pages/cadastros.dart';
import 'package:bootcamp_flutter/pages/dados.dart';
import 'package:bootcamp_flutter/pages/login.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo[50]),
              currentAccountPicture: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    context: context,
                    builder: (BuildContext bc) {
                      return Wrap(
                        children: [
                          ListTile(
                            onTap: () => Navigator.pop(context),
                            title: const Text("Camera"),
                            leading: const Icon(Icons.camera),
                          ),
                          ListTile(
                            onTap: () => Navigator.pop(context),
                            title: const Text("Galeria"),
                            leading: const Icon(Icons.album),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: CircleAvatar(
                    backgroundColor: Colors.cyanAccent[200],
                    child: Image.network(
                        "https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png")),
              ),
              accountName: const Text("Diogo"),
              accountEmail: const Text("diogo@gmail.com")),
          const SizedBox(
            height: 30,
          ),
          InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Cadastro(title: "Cadastro"),
                    ));
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.format_list_bulleted),
                      SizedBox(width: 5),
                      Text("Cadastros"),
                    ],
                  ))),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Dados(),
                    ));
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.format_list_bulleted),
                      SizedBox(width: 5),
                      Text("Meu dados"),
                    ],
                  ))),
          InkWell(
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: const Column(
                          children: [
                            Text("Termos de uso",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Do mesmo modo, a competitividade nas transações comerciais faz parte de um processo de gerenciamento das diversas correntes de pensamento.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ));
                    ;
                  },
                );
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.format_list_bulleted),
                      SizedBox(width: 5),
                      Text("Meu dados"),
                    ],
                  ))),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext bc) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.centerLeft,
                        title: const Text("App"),
                        content: const Wrap(
                            children: [Text("Deseja sair da conta?")]),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Login(),));
                              },
                              child: const Text("Sim")),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              }, child: const Text("Não")),
                        ],
                      );
                    });
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 5),
                      Text("Sair"),
                    ],
                  ))),
        ],
      ),
    );
  }
}
