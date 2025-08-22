import 'package:domain/util/ApiResult.dart';

abstract class UseCase<VALUE, PARAM> {
  Future<ApiResult<VALUE>> call(PARAM param);
}
