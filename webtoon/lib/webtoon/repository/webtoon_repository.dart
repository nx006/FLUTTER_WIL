import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:webtoon/common/const/data.dart';
import 'package:webtoon/common/dio/dio.dart';
import 'package:webtoon/webtoon/model/webtoon_model.dart';

part 'webtoon_repository.g.dart';

final webtoonRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);

  return WebtoonRepository(dio, baseUrl: baseUrl);
});

@RestApi()
abstract class WebtoonRepository {
  factory WebtoonRepository(Dio dio, {String baseUrl}) = _WebtoonRepository;

  @GET('/today')
  Future<List<WebtoonModel>> getTodayToon();
}
