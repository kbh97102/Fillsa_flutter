import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  // 1단계에서 만든 baseUrlProvider를 watch하여 URL 값을 가져옵니다.
  final baseUrl = "";

  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    // 여기에 필요한 헤더 등을 추가할 수 있습니다.
    // headers: { 'Authorization': 'Bearer ...' }
  );

  final dio = Dio(options);

  // 로깅 인터셉터 추가 (디버깅 시 매우 유용)
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  return dio;
}
