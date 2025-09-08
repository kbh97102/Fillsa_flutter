import 'package:dio/dio.dart';
import 'package:fillsa_flutter/data/local/local_database.dart';
import 'package:fillsa_flutter/data/local/local_quote_info_dao.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../di_config.dart';
import 'network/fillsa_api.dart';
import 'network/fillsa_no_token_api.dart';

@module
abstract class ApiModule {
  @lazySingleton
  FillsaApi provideFillsaApi(Dio dio) => FillsaApi(dio);

  @lazySingleton
  FillsaNoTokenApi provideFillsaNoTokenApi(Dio dio) => FillsaNoTokenApi(dio);

  @lazySingleton
  Dio dio() {
    final baseUrl = "https://www.fillsa.store";

    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      // 여기에 필요한 헤더 등을 추가할 수 있습니다.
      headers: {'X-App-Version': '1.0.16'},
    );

    final dio = Dio(options);

    // 로깅 인터셉터 추가 (디버깅 시 매우 유용)
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return dio;
  }

  @lazySingleton
  SharedPreferencesAsync providePref() => SharedPreferencesAsync();

  @preResolve // Future가 완료된 후 결과값을 주입하도록 합니다.
  @singleton
  Future<LocalDatabase> get db =>
      $FloorAppDatabase.databaseBuilder('app_database.db').build();

  // 2. 위에서 생성된 AppDatabase 인스턴스를 받아 TodoDao를 주입합니다.
  // injectable은 getIt에 등록된 AppDatabase를 자동으로 찾아 이 메소드의 파라미터로 넘겨줍니다.
  @lazySingleton
  LocalQuoteInfoDao get todoDao => getIt<LocalDatabase>().infoDao;
}
