import '../model/response/ErrorResponse.dart';

sealed class ApiResult<T> {}

final class Success<T> extends ApiResult<T> {
  final T data;
  Success(this.data);
}

final class Fail<T> extends ApiResult<T> {
  final ErrorResponse? error;
  Fail(this.error);
}

final class Error<T> extends ApiResult<T> {
  final Exception error;
  Error(this.error);
}
