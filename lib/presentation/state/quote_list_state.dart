import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/local_quote_info.dart';
import '../../domain/model/response/MemberQuotesResponse.dart';

part 'quote_list_state.freezed.dart';

@freezed
abstract class QuoteListState with _$QuoteListState {
  const factory QuoteListState({
    required DateTime startDate,
    required DateTime endDate,
    @Default(false) bool likeFilter,
    @Default([]) List<MemberQuotesResponse> memberQuotes,
    @Default([]) List<LocalQuoteInfo> localQuotes,
    @Default(false) bool isLogged,
    @Default(false) bool isLoading,
    @Default(true) bool hasMore,
    @Default(0) int currentPage,
    @Default(false) bool showCalendar,
  }) = _QuoteListState;

  factory QuoteListState.initial() {
    final now = DateTime.now();
    final startDate = DateTime(now.year < 2026 ? now.year : now.year - 1,
        now.year < 2026 ? 6 : now.month, 1);
    return QuoteListState(startDate: startDate, endDate: now);
  }
}
