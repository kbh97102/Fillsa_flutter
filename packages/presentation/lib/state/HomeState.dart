import 'package:freezed_annotation/freezed_annotation.dart';

part 'HomeState.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  // 생성자를 const로 만들어 불변성을 보장합니다.
  const factory HomeState({
    @Default(false) bool isLoading,
    String? data,
    String? error,
  }) = _HomeState;
}
