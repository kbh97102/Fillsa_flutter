import 'package:injectable/injectable.dart';

import '../model/api_result.dart';
import '../model/response/MemberMonthlyQuoteResponse.dart';
import '../model/response/MemberQuotesData.dart';
import '../model/response/MonthlySummaryData.dart';
import '../model/response/MonthlyQuoteResponse.dart';
import '../model/local_quote_info.dart';
import '../repository/calendar_repository.dart';
import '../repository/local_repository.dart';
import 'base_usecase.dart';

@lazySingleton
class GetMonthlyQuotesNonMemberUseCase
    extends ApiUseCase<MemberMonthlyQuoteResponse, String> {
  final CalendarRepository _calendarRepository;
  final LocalRepository _localRepository;

  GetMonthlyQuotesNonMemberUseCase(
    this._calendarRepository,
    this._localRepository,
  );

  @override
  Future<ApiResult<MemberMonthlyQuoteResponse>> call(String yearMonth) async {
    final result = await _calendarRepository.getMonthlyQuotesNonMember(yearMonth);

    if (result is Fail) return Fail((result as Fail).error);

    final quotes = (result as Success<List<MonthlyQuoteResponse>>).data;
    final localList = await _localRepository.getLocalQuotes();

    final merged = quotes.map((quote) {
      final localData = _findLocal(localList, quote.dailyQuoteSeq);
      return MemberQuotesData.fromLocal(quote: quote, localData: localData);
    }).toList();

    final typingCount = merged.where((q) => q.completed).length;
    final likeCount = merged.where((q) => q.isLiked).length;

    return Success(
      MemberMonthlyQuoteResponse(
        memberQuotes: merged,
        monthlySummary: MonthlySummaryData(
          typingCount: typingCount,
          likeCount: likeCount,
          streakCount: typingCount,
        ),
      ),
    );
  }

  LocalQuoteInfo? _findLocal(List<LocalQuoteInfo> list, int seq) {
    try {
      return list.firstWhere((l) => l.dailyQuoteSeq == seq);
    } catch (_) {
      return null;
    }
  }
}
