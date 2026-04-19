import 'package:injectable/injectable.dart';

import '../../domain/model/api_result.dart';
import '../../domain/model/response/MemberMonthlyQuoteResponse.dart';
import '../../domain/model/response/MonthlyQuoteResponse.dart';
import '../../domain/repository/calendar_repository.dart';
import '../network/fillsa_api.dart';
import '../network/fillsa_no_token_api.dart';
import 'base_repository.dart';

@LazySingleton(as: CalendarRepository)
class CalendarRepositoryImpl with BaseRepository implements CalendarRepository {
  final FillsaApi _api;
  final FillsaNoTokenApi _noTokenApi;

  CalendarRepositoryImpl(this._api, this._noTokenApi);

  @override
  Future<ApiResult<MemberMonthlyQuoteResponse>> getMonthlyQuotes(
    String yearMonth,
  ) {
    return safeApiCall(() => _api.getQuotesMonthly(yearMonth));
  }

  @override
  Future<ApiResult<List<MonthlyQuoteResponse>>> getMonthlyQuotesNonMember(
    String yearMonth,
  ) {
    return safeApiCall(
      () => _noTokenApi.getMonthlyQuotesNonMember(yearMonth),
    );
  }
}
