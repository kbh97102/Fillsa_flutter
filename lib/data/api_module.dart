import 'package:dio/dio.dart';
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
  Dio dio(TokenInterceptor tokenInterceptor) {
    final baseUrl = "https://www.fillsa.store";

    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      // 여기에 필요한 헤더 등을 추가할 수 있습니다.
      headers: {'X-App-Version': '1.0.16'},
    );

    final dio = Dio(options);

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    dio.interceptors.add(tokenInterceptor);

    return dio;
  }

  @lazySingleton
  SharedPreferencesAsync providePref() => SharedPreferencesAsync();
}
