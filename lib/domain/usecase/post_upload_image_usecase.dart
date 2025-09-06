import 'package:fillsa_flutter/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../model/request/post_upload_image_params.dart';
import '../repository/HomeRepository.dart';
import '../util/ApiResult.dart';

@lazySingleton
class PostUploadImageUseCase extends UseCase<int, PostUploadImageParams> {
  final HomeRepository _repository;

  PostUploadImageUseCase(this._repository);

  @override
  Future<ApiResult<int>> call(PostUploadImageParams params) {
    return _repository.postUploadImage(params.imageFile, params.dailyQuoteSeq);
  }
}
