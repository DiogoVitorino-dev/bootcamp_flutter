import 'package:dio/dio.dart';

class CustomMarvelDio {
  Dio _dio = Dio();

  CustomJsonPlaceholderDio() {
    _dio.options.baseUrl = "https://gateway.marvel.com";
  }

  Dio get getInstance => _dio;
}
