import 'package:data/network/fillsa_api.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio();
    return dio;
  }

  @lazySingleton
  FillsaApi fillsaApi(Dio dio) {
    const String baseUrl = "https://www.fillsa.store/";
    return FillsaApi(dio, baseUrl: baseUrl);
  }
}
