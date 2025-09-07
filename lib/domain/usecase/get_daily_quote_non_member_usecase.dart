import 'package:fillsa_flutter/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../model/response/DailyQuotaNoToken.dart';
import '../repository/HomeRepository.dart';
import '../util/ApiResult.dart';

@lazySingleton
class GetDailyNonMemberUseCase extends UseCase<DailyQuotaNoToken, String> {
  final HomeRepository _repository;

  GetDailyNonMemberUseCase(this._repository);

  @override
  Future<ApiResult<DailyQuotaNoToken>> call(String param) {
    return _repository.getDailyQuoteNoToken(param);
  }
}
