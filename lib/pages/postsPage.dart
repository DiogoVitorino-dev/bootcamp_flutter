import 'package:bootcamp_flutter/models/PostModel.dart';
import 'package:bootcamp_flutter/repository/postsRepository.dart';
import 'package:bootcamp_flutter/shared/widgets/CardPost.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  var repository = PostsRepository();
  List<PostModel> posts = [];

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  Future<void> getPosts() async {
    posts = await repository.getPosts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (_, index) {
          var post = posts[index];
          return CardPost(idPost: post.id, title: post.title, body: post.body);
        },
      ),
    );
  }
}
