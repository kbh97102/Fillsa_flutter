import 'dart:async';

import 'package:fillsa_flutter/domain/usecase/get_alarm_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/logout_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/get_image_uri_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/get_login_status_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/get_user_name_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/set_alarm_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/withdraw_usecase.dart';
import 'package:fillsa_flutter/presentation/state/mypage_state.dart';
import 'package:fillsa_flutter/presentation/viewmodels/base_viewmodel.dart';
import 'package:injectable/injectable.dart';
import 'package:riverpod/riverpod.dart';

@injectable
class MyPageViewModel extends AsyncNotifier<MyPageState> with BaseViewModel {
  final GetLoginStatusUseCase _getLoginStatusUseCase;
  final GetUserNameUseCase _getUserNameUseCase;
  final GetImageUriUseCase _getImageUriUseCase;
  final GetAlarmUseCase _getAlarmUseCase;
  final SetAlarmUseCase _setAlarmUseCase;
  final LogoutUseCase _logoutUseCase;
  final WithdrawUseCase _withdrawUseCase;

  MyPageViewModel(
    this._getLoginStatusUseCase,
    this._getUserNameUseCase,
    this._getImageUriUseCase,
    this._getAlarmUseCase,
    this._setAlarmUseCase,
    this._logoutUseCase,
    this._withdrawUseCase,
  );

  StreamSubscription<bool?>? _loginSub;
  bool _disposed = false;

  @override
  FutureOr<MyPageState> build() async {
    _disposed = false;
    ref.onDispose(() {
      _disposed = true;
      _loginSub?.cancel();
      onDispose();
    });

    bool isLogged = false;
    try {
      isLogged = await _getLoginStatusUseCase().first == true;
    } catch (_) {}

    final userName = await _getUserNameUseCase() ?? '';
    final imageUri = await _getImageUriUseCase();
    final isAlarmEnabled = await _getAlarmUseCase() ?? false;

    _loginSub = _getLoginStatusUseCase().skip(1).listen((status) {
      if (_disposed || !state.hasValue) return;
      final logged = status == true;
      state = AsyncValue.data(state.requireValue.copyWith(isLogged: logged));
      if (logged) _refreshUserData();
    });

    return MyPageState(
      isLogged: isLogged,
      userName: userName,
      imageUri: imageUri,
      isAlarmEnabled: isAlarmEnabled,
    );
  }

  Future<void> _refreshUserData() async {
    if (_disposed || !state.hasValue) return;
    final userName = await _getUserNameUseCase() ?? '';
    final imageUri = await _getImageUriUseCase();
    if (!_disposed && state.hasValue) {
      state = AsyncValue.data(
        state.requireValue.copyWith(userName: userName, imageUri: imageUri),
      );
    }
  }

  Future<void> logout() async {
    await _logoutUseCase();
  }

  Future<void> withdraw() async {
    await getResponse(() => _withdrawUseCase());
    await _logoutUseCase();
  }

  Future<void> toggleAlarm(bool value) async {
    await _setAlarmUseCase(value);
    if (state.hasValue) {
      state = AsyncValue.data(state.requireValue.copyWith(isAlarmEnabled: value));
    }
  }
}
