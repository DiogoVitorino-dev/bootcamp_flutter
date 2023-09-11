import 'package:bootcamp_flutter/shared/widgets/appImages.dart';
import 'package:flutter/material.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.foto1,height: 100),
        Image.asset(AppImages.foto2,height: 100),
        Image.asset(AppImages.foto3,height: 100),
        Image.asset(AppImages.foto4,height: 100),
        Image.asset(AppImages.foto5,height: 100),
        Image.asset(AppImages.foto6,height: 100),
      ],
    );
  }
}
