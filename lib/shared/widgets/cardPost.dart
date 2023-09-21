import 'package:flutter/material.dart';

class CardPost extends StatelessWidget {
  final int idPost;
  final String title;
  final String body;
  final Function()? onPress;

  const CardPost(
      {super.key,
      required this.idPost,
      required this.title,
      required this.body,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: Key(idPost.toString()),
      onTap: () => onPress != null ? onPress!() : null,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(body,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 14)),
              ],
            ),
          )),
    );
  }
}
