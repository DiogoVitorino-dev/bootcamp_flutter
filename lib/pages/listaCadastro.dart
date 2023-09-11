import 'package:bootcamp_flutter/models/cardDetail.dart';
import 'package:bootcamp_flutter/pages/CardDetail.dart';
import 'package:bootcamp_flutter/repositories/repositoryCardDetail.dart';
import 'package:flutter/material.dart';

class ListaCadastro extends StatefulWidget {
  const ListaCadastro({super.key});

  @override
  State<ListaCadastro> createState() => _ListaCadastroState();
}

class _ListaCadastroState extends State<ListaCadastro> {
  @override
  Widget build(BuildContext context) {
    CardDetail? cardDetail;

    void carregarDados() async {
			cardDetail = await RepositoryCardDetail().get();
			setState(() {});
    }

    @override
    void initState() {
      super.initState();
      carregarDados();
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          child: cardDetail == null ? const LinearProgressIndicator() : Hero(
            tag: cardDetail!.id,
            child: Card(
              elevation: 8,
              shadowColor: Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.network(
                              cardDetail!.url,
                              height: 30,
                            ),
                            Text(
                              cardDetail!.title,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.justify,
                            ),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CardDetailPage(
                                            cardDetail: cardDetail!,
                                          ),
                                        ));
                                  },
                                  child: const Text(
                                    "Ler mais",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  )),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          cardDetail!.text,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
