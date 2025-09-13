import 'package:fillsa_flutter/domain/model/response/login_response.dart';

import '../model/request/login_request.dart';

abstract class LoginRepository {
  Future<LoginResponse> login({required LoginRequest loginRequest});
}
