import 'package:domain/model/response/DailyQuotaNoToken.dart';
import 'package:domain/model/response/DailyQuoteDto.dart';
import 'package:domain/usecase/get_daily_quote_non_member_usecase.dart';
import 'package:domain/util/ApiResult.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../state/HomeState.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  final GetDailyNonMemberUseCase _getDailyNonMemberUseCase;

  HomeState _state = const HomeState(data: DailyQuoteDto.empty);

  HomeState get state => _state;

  HomeViewModel(this._getDailyNonMemberUseCase) {
    getData();
  }

  void getData() async {
    final data = await _getDailyNonMemberUseCase.call("2025-08-29");

    if (data is ApiSuccess) {
      final DailyQuotaNoToken noTokenDto = (data as ApiSuccess).data;
      final uiQuote = DailyQuoteDto(
        likeYn: 'N',
        imagePath: "",
        dailyQuoteSeq: noTokenDto.dailyQuoteSeq,
        korQuote: noTokenDto.korQuote,
        engQuote: noTokenDto.engQuote,
        korAuthor: noTokenDto.korAuthor,
        engAuthor: noTokenDto.engAuthor,
        authorUrl: noTokenDto.authorUrl,
      );

      _state = state.copyWith(data: uiQuote);
    }
  }
}
