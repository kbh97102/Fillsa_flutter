import 'package:domain/repository/HomeRepository.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:domain/util/ApiResult.dart';

import '../model/request/post_upload_image_params.dart';

class PostUploadImageUseCase extends UseCase<int, PostUploadImageParams> {
  final HomeRepository _repository;

  PostUploadImageUseCase(this._repository);

  @override
  Future<ApiResult<int>> call(PostUploadImageParams params) {
    return _repository.postUploadImage(params.imageFile, params.dailyQuoteSeq);
  }
}
