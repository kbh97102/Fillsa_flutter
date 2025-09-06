import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/response/DailyQuoteDto.dart';
import '../state/HomeState.dart';
import '../util/logger.dart';

// import '../util/providers.dart';

part 'home_viewmodel.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  // late final GetDailyNonMemberUseCase _getDailyNonMemberUseCase = ref.read(
  //   getDailyNonMemberUseCaseProvider,
  // );

  HomeViewModel();

  @override
  HomeState build() {
    logger.d(">>>> test start");
    getData();
    return const HomeState(data: DailyQuoteDto.empty);
  }

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
