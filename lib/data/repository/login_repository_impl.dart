import 'package:fillsa_flutter/data/network/fillsa_no_token_api.dart';
import 'package:fillsa_flutter/data/repository/base_repository.dart';
import 'package:fillsa_flutter/domain/model/api_result.dart';
import 'package:fillsa_flutter/domain/repository/login_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/request/login_request.dart';
import '../../domain/model/response/login_response.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository with BaseRepository {
  final FillsaNoTokenApi api;

  LoginRepositoryImpl({required this.api});

  @override
  Future<ApiResult<LoginResponse>> login({required LoginRequest loginRequest}) {
    return safeApiCall(() => api.login(loginRequest));
  }

  @override
  Future<ApiResult<void>> testErrorCode(int code) async {
    return safeApiCall(() => api.testErrorCode(code));
  }
}
