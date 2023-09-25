import 'package:bootcamp_flutter/models/MarvelHeroModel.dart';

abstract class IMarvelHeroAPI {
  Future<List<MarvelHeroModel>> getHeroes(int offset);
}
