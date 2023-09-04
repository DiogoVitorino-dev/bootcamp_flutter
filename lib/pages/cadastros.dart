import 'package:bootcamp_flutter/pages/historicoCadastro.dart';
import 'package:bootcamp_flutter/pages/listaCadastro.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  final String title;
  const Cadastro({super.key, required this.title});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Expanded(
        child: PageView(
					scrollDirection: Axis.vertical,
					controller: controller,
					children: const [
						ListaCadastro(),
						HistoricoCadastro(),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
				onTap: (value) => controller.jumpToPage(value),
        items: const [
          BottomNavigationBarItem(label: "Lista", icon: Icon(Icons.list)),
          BottomNavigationBarItem(label: "Historico", icon: Icon(Icons.history))
        ],
      ),
    );
  }
}
