import 'package:dio/dio.dart';
import 'package:domain/model/response/ErrorResponse.dart';
import 'package:domain/util/ApiResult.dart';
import 'package:retrofit/retrofit.dart';

mixin class BaseRepository {
  Future<ApiResult<T>> safeApiCall<T>(
    Future<HttpResponse<T>> Function() apiCall,
  ) async {
    try {
      final httpResponse = await apiCall();
      final statusCode = httpResponse.response.statusCode;

      if (statusCode != null && statusCode >= 200 && statusCode <= 299) {
        return ApiSuccess(httpResponse.data);
      } else {
        final errorResponse = ErrorResponse.fromJson(
          httpResponse.response.data,
        );
        return ApiFail(errorResponse);
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        try {
          final errorResponse = ErrorResponse.fromJson(e.response!.data);
          return ApiFail(errorResponse);
        } catch (jsonError) {
          return ApiError(e);
        }
      } else {
        return ApiError(e);
      }
    } catch (e) {
      return ApiError(Exception(e.toString()));
    }
  }
}
