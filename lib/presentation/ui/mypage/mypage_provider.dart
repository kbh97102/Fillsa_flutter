import 'package:fillsa_flutter/di_config.dart';
import 'package:fillsa_flutter/presentation/state/mypage_state.dart';
import 'package:fillsa_flutter/presentation/viewmodels/mypage_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myPageViewModelProvider =
    AsyncNotifierProvider.autoDispose<MyPageViewModel, MyPageState>(
      () => getIt<MyPageViewModel>(),
    );
