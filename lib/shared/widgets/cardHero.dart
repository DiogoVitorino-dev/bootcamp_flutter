import 'package:bootcamp_flutter/models/MarvelHeroModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardHero extends StatelessWidget {
  final MarvelHeroModel hero;
  const CardHero({super.key, required this.hero});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          hero.thumbnail.path.isNotEmpty
              ? Image.network(hero.thumbnail.path)
              : const Icon(Icons.account_box),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hero.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  hero.description,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
