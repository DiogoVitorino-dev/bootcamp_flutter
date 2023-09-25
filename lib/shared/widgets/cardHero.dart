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
          Image.network(
            hero.thumbnail.path,
            width: 150,
            height: 150,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.bolt_sharp,size: 150),
          ),
          Padding(          
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Expanded(
              child: Column(                                        
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    hero.name,
                    overflow: TextOverflow.ellipsis,                  
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    hero.description,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,                  
                    maxLines:4 ,
            
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
