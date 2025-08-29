import 'package:domain/usecase/get_daily_quote_non_member_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/HomeState.dart';

part 'home_viewmodel.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  late final GetDailyNonMemberUseCase _getDailyNonMemberUseCase = ref.read(
    getDail,
  );

  HomeViewModel();

  @override
  HomeState build() {
    return const HomeState();
  }
}
