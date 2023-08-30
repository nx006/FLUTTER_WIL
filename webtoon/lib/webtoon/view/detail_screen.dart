// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webtoon/common/layout/default_layout.dart';
import 'package:webtoon/webtoon/provider/webtoon_provider.dart';

class DetailScreen extends ConsumerWidget {
  static String get routeName => 'detailScreen';

  final String id;

  const DetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(webtoonProvider);

    final webtoon = state.firstWhere(
      (element) => element.id == id,
    );

    return DefaultLayout(
      title: webtoon.title,
      child: Container(),
    );
  }
}
