import 'package:bootcamp_flutter/models/cardDetail.dart';
import 'package:flutter/material.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;

  const CardDetailPage({super.key, required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return Hero(
			tag: cardDetail.id,
			child: SafeArea(
					child: Scaffold(
						body: Padding(
							padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
							child: Column(
								children: [
										IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))
										,
									Row(
										children: [
											Image.network(
												cardDetail.url,
												height: 60,
											),
											Text(
												cardDetail.title,
												style: const TextStyle(
														fontSize: 28, fontWeight: FontWeight.w600),
												textAlign: TextAlign.justify,
											),
										],
									),
									const SizedBox(
										height: 10,
									),
									Expanded(
											child: Text(
												cardDetail.text,
												style: const TextStyle(fontSize: 12),
											),
										),
								],
							),
						),
					),
				),
		);
  }
}
