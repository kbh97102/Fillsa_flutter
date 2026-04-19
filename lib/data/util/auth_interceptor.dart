import 'package:dio/dio.dart';
import 'package:fillsa_flutter/data/util/PrefKey.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final SharedPreferencesAsync _prefs;

  // 토큰 갱신에 사용하는 별도 Dio (인터셉터 없이)
  static const String _baseUrl = 'https://www.fillsa.store';
  static const String _refreshPath = '/api/v1/auth/refresh';

  AuthInterceptor(this._prefs);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    final refreshToken = await _prefs.getString(PrefKey.refreshToken);
    if (refreshToken == null || refreshToken.isEmpty) {
      return handler.next(err);
    }

    try {
      final refreshDio = Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),
        ),
      );

      final response = await refreshDio.post(
        _refreshPath,
        data: {'refreshToken': refreshToken},
      );

      final newAccessToken = response.data['accessToken'] as String?;
      final newRefreshToken = response.data['refreshToken'] as String?;

      if (newAccessToken == null || newAccessToken.isEmpty) {
        return handler.next(err);
      }

      await _prefs.setString(PrefKey.accessToken, newAccessToken);
      if (newRefreshToken != null) {
        await _prefs.setString(PrefKey.refreshToken, newRefreshToken);
      }

      // 원래 요청에 새 토큰으로 재시도
      final retryOptions = err.requestOptions.copyWith(
        headers: {
          ...err.requestOptions.headers,
          'Authorization': 'Bearer $newAccessToken',
        },
      );
      final retryResponse = await refreshDio.fetch(retryOptions);
      return handler.resolve(retryResponse);
    } catch (_) {
      return handler.next(err);
    }
  }
}
