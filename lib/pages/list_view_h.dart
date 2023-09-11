import 'package:bootcamp_flutter/shared/widgets/appImages.dart';
import 'package:flutter/material.dart';

class ListViewH extends StatelessWidget {
  const ListViewH({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Card(child: Image.asset(AppImages.foto1)),
              Card(child: Image.asset(AppImages.foto2)),
              Card(child: Image.asset(AppImages.foto3)),
              Card(child: Image.asset(AppImages.foto4)),
              Card(child: Image.asset(AppImages.foto5)),
              Card(child: Image.asset(AppImages.foto6)),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(),
        )
      ],
    );
  }
}
