import 'package:domain/usecase/get_daily_quote_non_member_usecase.dart';
import 'package:presentation/util/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/HomeState.dart';
import '../util/logger.dart';

part 'home_viewmodel.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  late final GetDailyNonMemberUseCase _getDailyNonMemberUseCase = ref.read(
    getDailyNonMemberUseCaseProvider,
  );

  HomeViewModel();

  @override
  HomeState build() {
    logger.d(">>>> test start");
    getData();
    return const HomeState();
  }

  void getData() async {
    final data = await _getDailyNonMemberUseCase.call("2025-08-29");
    logger.d(">>>> data $data");
  }
}
