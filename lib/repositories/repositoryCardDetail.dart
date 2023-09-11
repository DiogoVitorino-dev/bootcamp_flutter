import 'package:bootcamp_flutter/models/cardDetail.dart';

class RepositoryCardDetail {
  Future<CardDetail> get() async {
    await Future.delayed(const Duration(seconds: 2));
    return CardDetail(
        1,
        "Card 1",
        "Acima de tudo, é fundamental ressaltar que a contínua expansão de nossa atividade pode nos levar a considerar a reestruturação dos índices pretendidos.",
        "https://static.vecteezy.com/system/resources/previews/022/101/050/original/java-logo-transparent-free-png.png");
  }
}
