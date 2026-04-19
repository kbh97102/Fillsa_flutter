import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/response/MemberMonthlyQuoteResponse.dart';

part 'calendar_state.freezed.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  const factory CalendarState({
    @Default(null) MemberMonthlyQuoteResponse? monthlyData,
    required DateTime selectedDay,
    @Default('') String selectedDayQuote,
    @Default(false) bool isLogged,
  }) = _CalendarState;

  factory CalendarState.initial() => CalendarState(selectedDay: DateTime.now());
}
