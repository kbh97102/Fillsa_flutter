import 'package:fillsa_flutter/domain/usecase/usecase.dart';

import '../model/response/DailyQuoteDto.dart';
import '../repository/HomeRepository.dart';
import '../util/ApiResult.dart';

class GetDailyQuoteUseCase extends UseCase<DailyQuoteDto, String> {
  final HomeRepository _repository;

  GetDailyQuoteUseCase(this._repository);

  @override
  Future<ApiResult<DailyQuoteDto>> call(String quoteDate) {
    return _repository.getDailyQuote(quoteDate);
  }
}
