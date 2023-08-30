// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:webtoon/webtoon/model/webtoon_model.dart';

class WebtoonCard extends StatelessWidget {
  final String title;
  final String id;
  final String thumb;

  const WebtoonCard({
    Key? key,
    required this.title,
    required this.id,
    required this.thumb,
  }) : super(key: key);

  factory WebtoonCard.fromModel({
    required WebtoonModel model,
  }) {
    return WebtoonCard(
      title: model.title,
      id: model.id,
      thumb: model.thumb,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  offset: const Offset(10, 10),
                  color: Colors.black.withOpacity(0.5),
                )
              ]),
          width: 250,
          child: Image.network(
            thumb,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
