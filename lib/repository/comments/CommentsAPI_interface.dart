import 'package:bootcamp_flutter/models/CommentModel.dart';

abstract class ICommentsAPI {
  Future<List<CommentModel>> getComments(int postId);
}
