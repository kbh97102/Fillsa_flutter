import 'package:fillsa_flutter/domain/model/response/login_response.dart';

import '../model/api_result.dart';
import '../model/request/login_request.dart';

abstract class LoginRepository {
  Future<ApiResult<LoginResponse>> login({required LoginRequest loginRequest});
  Future<ApiResult<void>> testErrorCode(int code);
}
