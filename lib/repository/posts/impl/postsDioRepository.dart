import 'dart:io';

import 'package:bootcamp_flutter/models/PostModel.dart';
import 'package:bootcamp_flutter/repository/posts/PostsAPI_interface.dart';
import 'package:bootcamp_flutter/shared/API/CustomJsonPlaceholderDio.dart';

class PostsDioRepository implements IPostsAPI {

  @override
  Future<List<PostModel>> getPosts() async {
    var dio = CustomJsonPlaceholderDio().getInstance;
    var url = "/posts?limit=10";
    var response = await dio.get(url);

    if (response.statusCode == HttpStatus.ok) {
      List<dynamic> list = response.data;
      return list.map((e) => PostModel.fromJson(e)).toList();
    }

    return [];
  }
}
