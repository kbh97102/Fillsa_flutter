import 'package:injectable/injectable.dart';

import '../model/response/MemberTypingQuoteResponse.dart';
import '../repository/home_repository.dart';
import 'base_usecase.dart';

@lazySingleton
class GetTypingUseCase extends UseCase<MemberTypingQuoteResponse, int> {
  final HomeRepository _homeRepository;

  GetTypingUseCase(this._homeRepository);

  @override
  Future<MemberTypingQuoteResponse> call([int? param]) {
    assert(param != null, 'dailyQuoteSeq cannot be null.');
    return _homeRepository.getTyping(param!);
  }
}
