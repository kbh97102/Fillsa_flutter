import 'package:dio/dio.dart';
import 'package:fillsa_flutter/domain/usecase/get_access_token_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class TokenInterceptor extends Interceptor {
  final GetAccessTokenUseCase _getTokenUseCase;

  TokenInterceptor(this._getTokenUseCase);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _getTokenUseCase();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }
}
