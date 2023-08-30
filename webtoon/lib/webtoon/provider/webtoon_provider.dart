// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webtoon/webtoon/model/webtoon_model.dart';
import 'package:webtoon/webtoon/repository/webtoon_repository.dart';

class WebtoonStateNotifier extends StateNotifier<List<WebtoonModel>> {
  final WebtoonRepository repository;

  WebtoonStateNotifier({
    required this.repository,
  }) : super([]);

  Future<void> getTodayToon() async {
    try {
      state = await repository.getTodayToon();
    } catch (e) {
      // ignore: avoid_print
      print(e);
      state = [];
    }
  }
}
