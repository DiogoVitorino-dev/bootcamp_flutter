import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart' as crypto;
import 'package:convert/convert.dart';
import 'package:bootcamp_flutter/models/MarvelHeroModel.dart';
import 'package:bootcamp_flutter/repository/marvel/marvelHeroAPI_interface.dart';
import 'package:bootcamp_flutter/shared/API/CustomMarvelDio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HeroesDioRepository implements IMarvelHeroAPI {
  @override
  Future<List<MarvelHeroModel>> getHeroes() async {
    var dio = CustomMarvelDio().getInstance;

    var ts = DateTime.now().microsecondsSinceEpoch.toString();
    var publicKey = dotenv.get("MARVELPUBLICKEY");
    var apiKey = dotenv.get("MARVELAPIKEY");


    if (publicKey.isEmpty || apiKey.isEmpty) {
      throw "PRIVATE KEY OR API KEY NOT SET";
    }

    var hash = _generateMD5(ts + apiKey + publicKey);
    var params = "ts=$ts&apikey=$publicKey&hash=$hash";

    var url = "https://gateway.marvel.com/v1/public/characters?$params";
    var response = await dio.get(url);

    if (response.statusCode == HttpStatus.ok) {
      List<dynamic> list = response.data.results;
      return list.map((e) => MarvelHeroModel.fromJson(e)).toList();
    }

    return [];
  }

  _generateMD5(String data) {
    var dataBytes = const Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(dataBytes);
    return hex.encode(digest.bytes);
  }
}
