import 'package:bootcamp_flutter/models/CommentModel.dart';
import 'package:bootcamp_flutter/repository/commentsRepository.dart';
import 'package:bootcamp_flutter/shared/widgets/cardPost.dart';
import 'package:flutter/material.dart';

class CommentsBottomSheet extends StatefulWidget {
  final int postId;
  const CommentsBottomSheet({super.key, required this.postId});

  @override
  State<CommentsBottomSheet> createState() => _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends State<CommentsBottomSheet> {
  List<CommentModel> list = [];
  var repository = CommentsRepository();

  Future<void> getComments() async {
    list = await repository.getComments(widget.postId);
  }

  @override
  void initState() {
    getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
        var comment = list[index];

        return CardPost(
            idPost: comment.id, title: comment.name, body: comment.body);
      },
    );
  }
}
