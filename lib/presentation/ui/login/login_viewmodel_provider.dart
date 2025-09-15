import 'package:fillsa_flutter/presentation/ui/login/login_result.dart';
import 'package:fillsa_flutter/presentation/viewmodels/login_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../di_config.dart';

final loginViewModelProvider =
    AsyncNotifierProvider.autoDispose<LoginViewModel, LoginResult>(
      // getIt을 호출하는 대신, Notifier 클래스의 인스턴스를 생성
      () => getIt<LoginViewModel>(),
    );
