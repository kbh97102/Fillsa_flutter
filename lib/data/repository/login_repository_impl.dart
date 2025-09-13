import 'package:fillsa_flutter/data/network/fillsa_no_token_api.dart';
import 'package:fillsa_flutter/domain/repository/login_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/request/login_request.dart';
import '../../domain/model/response/login_response.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository {
  final FillsaNoTokenApi api;

  LoginRepositoryImpl({required this.api});

  @override
  Future<LoginResponse> login({required LoginRequest loginRequest}) {
    return api.login(loginRequest);
  }
}
