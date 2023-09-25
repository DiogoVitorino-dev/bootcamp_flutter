import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomJsonPlaceholderDio {
  Dio _dio = Dio();

  CustomJsonPlaceholderDio() {
    var baseUrl = dotenv.get("JSONPLACEHOLDERURL");
    if (baseUrl.isEmpty) {
      throw "MISSING JSONPLACEHOLDERURL VALUE AT ENVIRONMENT VARIABLES";
    }
    _dio.options.baseUrl = baseUrl;
  }

  Dio get getInstance => _dio;
}
