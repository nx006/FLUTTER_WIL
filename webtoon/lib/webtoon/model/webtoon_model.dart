import 'package:freezed_annotation/freezed_annotation.dart';

part 'webtoon_model.freezed.dart';
part 'webtoon_model.g.dart';

@freezed
class WebtoonModel with _$WebtoonModel {
  const factory WebtoonModel({
    required String title,
    required String thumb,
    required String id,
  }) = _WebtoonModel;

  factory WebtoonModel.fromJson(Map<String, dynamic> json) =>
      _$WebtoonModelFromJson(json);
}
