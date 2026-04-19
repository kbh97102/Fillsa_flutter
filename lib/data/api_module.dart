import 'package:dio/dio.dart';
import 'package:fillsa_flutter/data/util/auth_interceptor.dart';
import 'package:fillsa_flutter/data/util/token_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'network/fillsa_api.dart';
import 'network/fillsa_no_token_api.dart';

@module
abstract class ApiModule {
  @lazySingleton
  FillsaApi provideFillsaApi(Dio dio) => FillsaApi(dio);

  @lazySingleton
  FillsaNoTokenApi provideFillsaNoTokenApi(Dio dio) => FillsaNoTokenApi(dio);

  @lazySingleton
  Dio dio(TokenInterceptor tokenInterceptor, AuthInterceptor authInterceptor) {
    const baseUrl = 'https://www.fillsa.store';

    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {'X-App-Version': '1.0.16'},
    );

    final dio = Dio(options);

    // 순서 중요: TokenInterceptor(요청 시 토큰 추가) → AuthInterceptor(401 시 갱신) → Logger
    dio.interceptors.add(tokenInterceptor);
    dio.interceptors.add(authInterceptor);
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return dio;
  }

  @lazySingleton
  SharedPreferencesAsync providePref() => SharedPreferencesAsync();
}
