import 'package:fillsa_flutter/domain/model/api_result.dart';
import 'package:fillsa_flutter/domain/repository/login_repository.dart';
import 'package:injectable/injectable.dart';

import '../usecase/base_usecase.dart';

@lazySingleton
class TestErrorCodeUsecase extends UseCase<ApiResult<void>, int> {
  final LoginRepository _loginRepository;

  TestErrorCodeUsecase(this._loginRepository);

  @override
  Future<ApiResult<void>> call(int param) {
    return _loginRepository.testErrorCode(param);
  }
}
