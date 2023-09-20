import 'package:flutter/material.dart';

class CardPost extends StatelessWidget {
  final int idPost;
  final String title;
  final String body;

  const CardPost(
      {super.key,
      required this.idPost,
      required this.title,
      required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
        key: Key(idPost.toString()),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(body,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14)),
            ],
          ),
        ));
  }
}
