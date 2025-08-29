import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
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
