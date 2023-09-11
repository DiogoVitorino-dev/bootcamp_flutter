import 'package:bootcamp_flutter/shared/widgets/appImages.dart';
import 'package:flutter/material.dart';

class ListViewV extends StatelessWidget {
  const ListViewV({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.menu),
          title: const Text("Usuario 2"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Ola"), Text("12:00")],
          ),
          trailing: PopupMenuButton<String>(
						onSelected: (value) {
						  if (value == "opcao1") {}
						},
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
								const PopupMenuItem<String>(value: "opcao1", child: Text("Opção 1")),
								const PopupMenuItem<String>(value: "opcao2", child: Text("Opção 2")),
								const PopupMenuItem<String>(value: "opcao3", child: Text("Opção 3")),
							];
            },
          ),
        ),
        Image.asset(AppImages.foto1, height: 100),
        Image.asset(AppImages.foto2, height: 100),
        Image.asset(AppImages.foto3, height: 100),
        Image.asset(AppImages.foto4, height: 100),
        Image.asset(AppImages.foto5, height: 100),
        Image.asset(AppImages.foto6, height: 100),
      ],
    );
  }
}
