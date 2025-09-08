import 'package:fillsa_flutter/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

import '../model/response/DailyQuotaNoToken.dart';
import '../repository/home_repository.dart';
import '../util/ApiResult.dart';

@lazySingleton
class GetDailyNonMemberUseCase extends ApiUseCase<DailyQuotaNoToken, String> {
  final HomeRepository _repository;

  GetDailyNonMemberUseCase(this._repository);

  @override
  Future<ApiResult<DailyQuotaNoToken>> call([String? param]) {
    return _repository.getDailyQuoteNoToken(param ?? "");
  }
}
