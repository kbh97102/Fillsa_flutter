import 'package:fillsa_flutter/domain/model/response/DailyQuoteDto.dart';
import 'package:fillsa_flutter/presentation/state/HomeState.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecase/get_daily_quote_non_member_usecase.dart';

// import '../util/providers.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  final GetDailyNonMemberUseCase _getDailyNonMemberUseCase;

  HomeState _state = const HomeState(data: DailyQuoteDto.empty);
  HomeState get state => _state;

  HomeViewModel(this._getDailyNonMemberUseCase);

  // @override
  // HomeState build() {
  //   logger.d(">>>> test start");
  //   getData();
  //   return const HomeState(data: DailyQuoteDto.empty);
  // }

  void getData() async {
    // final data = await _getDailyNonMemberUseCase.call("2025-08-29");
    //
    // if (data is ApiSuccess) {
    //   final DailyQuotaNoToken noTokenDto = (data as ApiSuccess).data;
    //   final uiQuote = DailyQuoteDto(
    //     likeYn: 'N',
    //     imagePath: "",
    //     dailyQuoteSeq: noTokenDto.dailyQuoteSeq,
    //     korQuote: noTokenDto.korQuote,
    //     engQuote: noTokenDto.engQuote,
    //     korAuthor: noTokenDto.korAuthor,
    //     engAuthor: noTokenDto.engAuthor,
    //     authorUrl: noTokenDto.authorUrl,
    //   );
    //
    //   state = state.copyWith(data: uiQuote);
  }
}
