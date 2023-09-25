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
  ScrollController scrollController = ScrollController();
  List<MarvelHeroModel> list = [];
  int offset = 0;
  bool loading = false;
  var repository = HeroesDioRepository();

  Future<void> getList() async {
    if (loading) return;
    setState(() {
      loading = true;
    });
    if (list.isEmpty) {
      list = await repository.getHeroes(offset);
    } else {
      offset += list.length;
      list.addAll(await repository.getHeroes(offset));
    }
    setState(() {
      loading = false;
    });
  }

  void onPressMoreItems() {
    getList();
  }

  @override
  void initState() {
    getList();
    scrollController.addListener(() {
      var limitPosition = scrollController.position.maxScrollExtent * 0.7;
      if (scrollController.position.pixels > limitPosition) {
        getList();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                var hero = list[index];
                return CardHero(hero: hero);
              },
            ),
          ),
          loading == false
              ? ElevatedButton(
                  onPressed: onPressMoreItems,
                  child: const Text("Carregar mais heróis"),
                )
              : const CircularProgressIndicator()
        ],
      ),
    );
  }
}
