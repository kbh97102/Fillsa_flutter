import 'package:injectable/injectable.dart';

import '../model/request/post_upload_image_params.dart';
import '../repository/home_repository.dart';
import 'base_usecase.dart';

@lazySingleton
class PostUploadImageUseCase extends UseCase<int, PostUploadImageParams> {
  final HomeRepository _repository;

  PostUploadImageUseCase(this._repository);

  @override
  Future<int> call(PostUploadImageParams param) {
    return _repository.postUploadImage(param.imageFile, param.dailyQuoteSeq);
  }
}
