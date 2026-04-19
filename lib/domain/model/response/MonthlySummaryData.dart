import 'package:json_annotation/json_annotation.dart';

part 'MonthlySummaryData.g.dart';

@JsonSerializable()
class MonthlySummaryData {
  final int typingCount;
  final int likeCount;
  @JsonKey(defaultValue: 0)
  final int streakCount;

  MonthlySummaryData({
    required this.typingCount,
    required this.likeCount,
    this.streakCount = 0,
  });

  factory MonthlySummaryData.fromJson(Map<String, dynamic> json) =>
      _$MonthlySummaryDataFromJson(json);
  Map<String, dynamic> toJson() => _$MonthlySummaryDataToJson(this);
}
