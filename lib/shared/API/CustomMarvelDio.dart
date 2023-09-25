import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomMarvelDio {
  Dio _dio = Dio();

  CustomJsonPlaceholderDio() {
    var baseUrl = dotenv.get("MARVELURL");
    if (baseUrl.isEmpty) {
      throw "MISSING MARVELURL VALUE AT ENVIRONMENT VARIABLES";
    }
    _dio.options.baseUrl = baseUrl;
  }

  Dio get getInstance => _dio;
}
