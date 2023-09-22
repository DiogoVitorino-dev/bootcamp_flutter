import 'package:bootcamp_flutter/models/PostModel.dart';

abstract class IPostsAPI {
  Future<List<PostModel>> getPosts();
}
