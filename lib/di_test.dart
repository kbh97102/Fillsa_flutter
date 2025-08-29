import 'package:domain/usecase/get_daily_quote_non_member_usecase.dart';
import 'package:fillsa_flutter/packages/data/lib/repository/HomeRepositoryImpl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'di_test.g.dart';

@riverpod
GetDailyNonMemberUseCase getDailyNonMemberUseCase(Ref ref) {
  // ref.watch를 통해 repositoryProvider를 구독하고, 그 결과(인스턴스)를 가져옵니다.
  final repository = ref.watch(homeRepositoryProvider);
  // 가져온 repository 인스턴스를 UseCase의 생성자에 주입하여 반환합니다.
  return GetDailyNonMemberUseCase(repository);
}
