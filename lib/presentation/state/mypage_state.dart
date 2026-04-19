import 'package:freezed_annotation/freezed_annotation.dart';

part 'mypage_state.freezed.dart';

@freezed
abstract class MyPageState with _$MyPageState {
  const factory MyPageState({
    @Default(false) bool isLogged,
    @Default('') String userName,
    String? imageUri,
    @Default(false) bool isAlarmEnabled,
  }) = _MyPageState;

  factory MyPageState.initial() => const MyPageState();
}
