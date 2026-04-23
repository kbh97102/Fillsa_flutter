import 'package:json_annotation/json_annotation.dart';

part 'member_streak_response.g.dart';

@JsonSerializable()
class MemberStreakResponse {
  @JsonKey(defaultValue: 0)
  final int currentStreak;
  @JsonKey(defaultValue: false)
  final bool isTodayWritten;

  MemberStreakResponse({
    this.currentStreak = 0,
    this.isTodayWritten = false,
  });

  factory MemberStreakResponse.fromJson(Map<String, dynamic> json) =>
      _$MemberStreakResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MemberStreakResponseToJson(this);
}
