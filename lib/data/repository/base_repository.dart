import 'package:dio/dio.dart';

import '../../domain/model/api_result.dart';
import '../../domain/model/response/ErrorResponse.dart';

mixin class BaseRepository {
  Future<ApiResult<T>> safeApiCall<T>(
    Future<Response<T>> Function() call,
  ) async {
    try {
      final response = await call();

      // Dio는 성공적인 응답(2xx)만 이곳으로 내려주고, 나머지는 DioException을 던집니다.
      // 따라서 isSuccessful 체크는 사실상 필요 없지만, 명시적으로 방어 코드를 넣을 수 있습니다.
      if (response.data != null) {
        return Success(response.data as T);
      } else {
        // body가 null인 성공 응답 처리 (예: 204 No Content)
        // 이 경우 T가 dynamic 또는 Unit/void와 같은 타입이어야 합니다.
        // 여기서는 실패로 간주하고 기본 에러를 반환합니다.
        return Fail(ErrorResponse.defaultError());
      }
    } on DioException catch (e) {
      // Dio에서 발생한 에러 처리
      if (e.response != null) {
        // 서버가 에러 응답을 반환한 경우
        final statusCode = e.response!.statusCode;

        switch (statusCode) {
          case 401:
          case 403:
            // 401, 403 에러는 토큰 만료로 처리
            return Fail(ErrorResponse.tokenExpiredError());
          default:
            // 그 외 서버 에러
            try {
              // 서버에서 내려준 errorBody를 ErrorResponse로 파싱
              final errorResponse = ErrorResponse.fromJson(e.response!.data);
              return Fail(errorResponse);
            } catch (jsonError) {
              // 파싱 실패 시 기본 에러 처리
              return Fail(ErrorResponse.defaultError());
            }
        }
      } else {
        // 네트워크 연결 오류 등 (서버로부터 응답을 받지 못한 경우)
        // return Fail(NetworkError());
        return Fail(
          ErrorResponse(
            timestamp: "",
            message: "",
            httpStatus: 404,
            errorCode: 404,
          ),
        );
      }
    } catch (e) {
      // DioException이 아닌 다른 종류의 예외 처리
      return Fail(ErrorResponse.defaultError());
    }
  }
}
