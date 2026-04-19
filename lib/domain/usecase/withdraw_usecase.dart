import 'package:fillsa_flutter/domain/model/api_result.dart';
import 'package:fillsa_flutter/domain/repository/mypage_repository.dart';
import 'package:fillsa_flutter/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WithdrawUseCase extends NoParamUseCase<ApiResult<void>> {
  final MyPageRepository _myPageRepository;

  WithdrawUseCase(this._myPageRepository);

  @override
  Future<ApiResult<void>> call() {
    return _myPageRepository.withdraw();
  }
}
