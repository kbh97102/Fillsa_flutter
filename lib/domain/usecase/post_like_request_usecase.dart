import 'package:fillsa_flutter/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

import '../model/request/post_like_params.dart';
import '../repository/home_repository.dart';

@lazySingleton
class PostLikeUseCase extends UseCase<int, PostLikeParams> {
  final HomeRepository _repository;

  PostLikeUseCase(this._repository);

  @override
  Future<int> call(PostLikeParams param) {
    return _repository.postLike(param.likeRequest, param.dailyQuoteSeq);
  }
}
