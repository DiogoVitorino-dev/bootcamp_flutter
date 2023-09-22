import 'package:dio/dio.dart';

class CustomJsonPlaceholderDio {
  Dio _dio = Dio();

  CustomJsonPlaceholderDio() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
  }

  Dio get getInstance => _dio;
}
