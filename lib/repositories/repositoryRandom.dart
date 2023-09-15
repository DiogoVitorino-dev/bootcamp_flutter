import 'package:bootcamp_flutter/models/random.dart';
import 'package:hive/hive.dart';

enum REPOSITORY_KEYS { BOX_RANDOM, RANDOM_NUM_KEY, RANDOM_QUANTITY_KEY }

class RepositoryRandom {
  static late Box _box;

  RepositoryRandom.create();

  static Future<RepositoryRandom> load() async {
    if (!Hive.isBoxOpen(REPOSITORY_KEYS.BOX_RANDOM.toString())) {
      _box = await Hive.openBox(REPOSITORY_KEYS.BOX_RANDOM.toString());
    } else {
      _box = Hive.box(REPOSITORY_KEYS.BOX_RANDOM.toString());
    }
    return RepositoryRandom.create();
  }

  Future<void> save(RandomModel random) async {
    await _box.put(REPOSITORY_KEYS.BOX_RANDOM.toString(), {
      "${REPOSITORY_KEYS.RANDOM_NUM_KEY}": random.randomNumber,
      "${REPOSITORY_KEYS.RANDOM_QUANTITY_KEY}": random.quantityNum,
    });
  }

  RandomModel restore() {
    var restored = _box.get(REPOSITORY_KEYS.BOX_RANDOM.toString());
    if (restored == null) {
      return RandomModel.vazio();
    } else {
      String randomNum = restored[REPOSITORY_KEYS.RANDOM_NUM_KEY.toString()];
      String quantityNum =
          restored[REPOSITORY_KEYS.RANDOM_QUANTITY_KEY.toString()];
      return RandomModel(int.parse(randomNum), int.parse(quantityNum));
    }
  }
}
