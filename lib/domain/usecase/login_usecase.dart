import 'package:fillsa_flutter/domain/repository/login_repository.dart';
import 'package:fillsa_flutter/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

import '../model/request/login_request.dart';
import '../model/response/login_response.dart';

@lazySingleton
class LoginUseCase extends UseCase<LoginResponse, LoginRequest> {
  final LoginRepository repository;
  LoginUseCase(this.repository);

  @override
  Future<LoginResponse> call(LoginRequest param) {
    return repository.login(loginRequest: param);
  }
}
