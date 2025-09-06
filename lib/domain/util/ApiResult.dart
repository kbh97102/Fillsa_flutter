import '../model/response/ErrorResponse.dart';

sealed class ApiResult<T> {}

final class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  ApiSuccess(this.data);
}

final class ApiFail<T> extends ApiResult<T> {
  final ErrorResponse? error;
  ApiFail(this.error);
}

final class ApiError<T> extends ApiResult<T> {
  final Exception error;
  ApiError(this.error);
}
