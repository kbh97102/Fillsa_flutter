import 'package:injectable/injectable.dart';

import '../model/api_result.dart';
import '../model/response/MemberMonthlyQuoteResponse.dart';
import '../repository/calendar_repository.dart';
import 'base_usecase.dart';

@lazySingleton
class GetMonthlyQuotesUseCase
    extends ApiUseCase<MemberMonthlyQuoteResponse, String> {
  final CalendarRepository _repository;

  GetMonthlyQuotesUseCase(this._repository);

  @override
  Future<ApiResult<MemberMonthlyQuoteResponse>> call(String yearMonth) {
    return _repository.getMonthlyQuotes(yearMonth);
  }
}
