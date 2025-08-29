import 'package:domain/repository/HomeRepository.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:domain/util/ApiResult.dart';

import '../model/response/DailyQuotaNoToken.dart';

class GetDailyNonMemberUseCase extends UseCase<DailyQuotaNoToken, String> {
  final HomeRepository _repository;

  GetDailyNonMemberUseCase(this._repository);

  @override
  Future<ApiResult<DailyQuotaNoToken>> call(String param) {
    return _repository.getDailyQuoteNoToken(param);
  }
}
