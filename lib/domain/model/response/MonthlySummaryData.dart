import 'package:json_annotation/json_annotation.dart';

part 'MonthlySummaryData.g.dart';

@JsonSerializable()
class MonthlySummaryData {
  final int typingCount;
  final int likeCount;

  MonthlySummaryData({required this.typingCount, required this.likeCount});

  factory MonthlySummaryData.fromJson(Map<String, dynamic> json) =>
      _$MonthlySummaryDataFromJson(json);
  Map<String, dynamic> toJson() => _$MonthlySummaryDataToJson(this);
}
