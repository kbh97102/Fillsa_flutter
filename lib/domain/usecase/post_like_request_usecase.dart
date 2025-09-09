import 'package:fillsa_flutter/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

import '../model/request/post_like_params.dart';
import '../model/response/SimpleIntResponse.dart';
import '../repository/home_repository.dart';

@lazySingleton
class PostLikeUseCase extends UseCase<SimpleIntResponse, PostLikeParams> {
  final HomeRepository _repository;

  PostLikeUseCase(this._repository);

  @override
  Future<SimpleIntResponse> call(PostLikeParams param) {
    return _repository.postLike(param.likeRequest, param.dailyQuoteSeq);
  }
}
