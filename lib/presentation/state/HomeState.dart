import 'package:fillsa_flutter/presentation/util/LocaleOption.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/response/DailyQuoteDto.dart';
import '../../domain/model/streak_info.dart';

part 'HomeState.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  // 생성자를 const로 만들어 불변성을 보장합니다.
  const factory HomeState({
    @Default(false) bool isLoading,
    required DailyQuoteDto data,
    String? error,
    @Default(false) bool isLogged,
    required DateTime? targetDate,
    @Default(LocaleOption.KR) LocaleOption currentLocale,
    @Default(false) bool isLiked,
    StreakInfo? streakInfo,
  }) = _HomeState;

  factory HomeState.initial() =>
      HomeState(data: DailyQuoteDto.empty, targetDate: DateTime.now());
}
