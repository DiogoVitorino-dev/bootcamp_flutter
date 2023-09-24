import 'package:bootcamp_flutter/models/MarvelHeroModel.dart';
import 'package:bootcamp_flutter/repository/marvel/impl/HeroesDioRepository.dart';
import 'package:bootcamp_flutter/shared/widgets/cardHero.dart';
import 'package:flutter/material.dart';

class HeroesPage extends StatefulWidget {
  const HeroesPage({super.key});

  @override
  State<HeroesPage> createState() => _HeroesPageState();
}

class _HeroesPageState extends State<HeroesPage> {
  List<MarvelHeroModel> list = [];
  var repository = HeroesDioRepository();

  Future<void> getList() async {
    list = await repository.getHeroes();  
    
    setState(() {});
  }

  @override
  void initState() {
    getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          var hero = list[index];          
          return CardHero(hero: hero);
        },
      ),
    );
  }
}
