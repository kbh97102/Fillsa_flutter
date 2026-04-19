import '../model/api_result.dart';
import '../model/response/MemberMonthlyQuoteResponse.dart';
import '../model/response/MonthlyQuoteResponse.dart';

abstract class CalendarRepository {
  Future<ApiResult<MemberMonthlyQuoteResponse>> getMonthlyQuotes(String yearMonth);

  Future<ApiResult<List<MonthlyQuoteResponse>>> getMonthlyQuotesNonMember(String yearMonth);
}
