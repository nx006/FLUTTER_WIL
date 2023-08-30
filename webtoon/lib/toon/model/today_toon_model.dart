import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_toon_model.freezed.dart';
part 'today_toon_model.g.dart';

@freezed
class TodayToonModel with _$TodayToonModel {
  const factory TodayToonModel({
    required String title,
    required String thumb,
    required String id,
  }) = _TodayToonModel;

  factory TodayToonModel.fromJson(Map<String, dynamic> json) =>
      _$TodayToonModelFromJson(json);
}
