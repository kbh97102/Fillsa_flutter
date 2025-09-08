import 'package:fillsa_flutter/domain/util/ApiResult.dart';

abstract class BaseUseCase<VALUE, PARAM> {
  Future<VALUE> call([PARAM param]);
}

abstract class StreamUseCase<VALUE, PARAM> {
  Stream<VALUE> call([PARAM param]);
}

abstract class ApiUseCase<VALUE, PARAM>
    extends BaseUseCase<ApiResult<VALUE>, PARAM> {
  Future<ApiResult<VALUE>> call([PARAM param]);
}
