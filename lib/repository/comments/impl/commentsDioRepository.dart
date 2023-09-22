import 'dart:io';

import 'package:bootcamp_flutter/models/CommentModel.dart';
import 'package:bootcamp_flutter/repository/comments/CommentsAPI_interface.dart';
import 'package:bootcamp_flutter/shared/API/CustomJsonPlaceholderDio.dart';

class CommentsDioRepository implements ICommentsAPI {
  @override
  Future<List<CommentModel>> getComments(int postId) async {
    var dio = CustomJsonPlaceholderDio().getInstance;
    var url = "/posts/$postId/comments";
    var response = await dio.get(url);

    if (response.statusCode == HttpStatus.ok) {
      List<dynamic> list = response.data;
      return list.map((e) => CommentModel.fromJson(e)).toList();
    }

    return [];
  }
}
