import 'dart:convert';
import 'dart:io';

import 'package:bootcamp_flutter/models/PostModel.dart';
import 'package:http/http.dart' as http;

class PostsRepository {
  Future<List<PostModel>> getPosts() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts?limit=10");
    var response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      List<dynamic> list = jsonDecode(response.body);
      return list.map((e) => PostModel.fromJson(e)).toList();
    }

    return [];
  }
}
