import 'package:dio/dio.dart';
import 'package:fillsa_flutter/data/util/PrefKey.dart';
import 'package:fillsa_flutter/domain/usecase/logout_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final SharedPreferencesAsync _prefs;
  final LogoutUseCase _logoutUseCase;

  static const String _baseUrl = 'https://www.fillsa.store';
  static const String _refreshPath = '/api/v1/auth/refresh';

  AuthInterceptor(this._prefs, this._logoutUseCase);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    final refreshToken = await _prefs.getString(PrefKey.refreshToken);
    if (refreshToken == null || refreshToken.isEmpty) {
      debugPrint('[AuthInterceptor] refreshToken 없음 → 갱신 불가');
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
        data: {'deviceId': '', 'refreshToken': refreshToken},
      );

      debugPrint('[AuthInterceptor] refresh 성공: ${response.statusCode}');
      final newAccessToken = response.data['accessToken'] as String?;
      final newRefreshToken = response.data['refreshToken'] as String?;

      if (newAccessToken == null || newAccessToken.isEmpty) {
        await _logoutUseCase();
        return handler.next(err);
      }

      await _prefs.setString(PrefKey.accessToken, newAccessToken);
      if (newRefreshToken != null) {
        await _prefs.setString(PrefKey.refreshToken, newRefreshToken);
      }

      final retryOptions = err.requestOptions.copyWith(
        headers: {
          ...err.requestOptions.headers,
          'Authorization': 'Bearer $newAccessToken',
        },
      );
      final retryResponse = await refreshDio.fetch(retryOptions);
      return handler.resolve(retryResponse);
    } catch (e, st) {
      debugPrint('[AuthInterceptor] refresh 실패: $e\n$st');
      // refresh 실패(토큰 만료 등) → 강제 로그아웃
      await _logoutUseCase();
      return handler.next(err);
    }
  }
}
