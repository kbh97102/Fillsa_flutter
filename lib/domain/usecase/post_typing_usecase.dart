import 'package:fillsa_flutter/domain/repository/home_repository.dart';
import 'package:fillsa_flutter/domain/usecase/base_usecase.dart';
import 'package:injectable/injectable.dart';

import '../model/request/typing_quote_request.dart';

@lazySingleton
class PostTypingUseCase
    extends UseCase<void, ({int dailyQuoteSeq, TypingQuoteRequest request})> {
  final HomeRepository _homeRepository;

  PostTypingUseCase(this._homeRepository);

  @override
  Future<void> call(({int dailyQuoteSeq, TypingQuoteRequest request}) param) {
    return _homeRepository.postTyping(param.dailyQuoteSeq, param.request);
  }
}
