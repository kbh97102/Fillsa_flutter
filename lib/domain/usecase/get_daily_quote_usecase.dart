import 'package:fillsa_flutter/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

import '../model/response/DailyQuoteDto.dart';
import '../repository/home_repository.dart';

@lazySingleton
class GetDailyQuoteUseCase extends UseCase<DailyQuoteDto, String> {
  final HomeRepository _repository;

  GetDailyQuoteUseCase(this._repository);

  @override
  Future<DailyQuoteDto> call([String? quoteDate]) {
    return _repository.getDailyQuote(quoteDate ?? "");
  }
}
