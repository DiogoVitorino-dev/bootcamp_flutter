import 'dart:convert';
import 'dart:io';

import 'package:bootcamp_flutter/models/CommentModel.dart';
import 'package:http/http.dart' as http;

class CommentsRepository {
  Future<List<CommentModel>> getComments(int postId) async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts/$postId/comments");
    var response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      List<dynamic> list = jsonDecode(response.body);
      return list.map((e) => CommentModel.fromJson(e)).toList();
    }

    return [];

  }
}