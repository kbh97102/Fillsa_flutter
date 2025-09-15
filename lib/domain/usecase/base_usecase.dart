import '../model/api_result.dart';

abstract class BaseUseCase {}

abstract class UseCase<VALUE, PARAM> extends BaseUseCase {
  Future<VALUE> call(PARAM param);
}

abstract class ApiUseCase<VALUE, PARAM> extends BaseUseCase {
  Future<ApiResult<VALUE>> call(PARAM param);
}

abstract class NoParamUseCase<VALUE> extends BaseUseCase {
  Future<VALUE> call();
}

abstract class StreamUseCase<VALUE, PARAM> extends BaseUseCase {
  Stream<VALUE> call([PARAM param]);
}
