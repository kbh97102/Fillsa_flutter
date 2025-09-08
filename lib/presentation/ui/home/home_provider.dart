import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import '../../../di_config.dart';
import '../../state/HomeState.dart';
import '../../viewmodels/home_viewmodel.dart';

// final homeViewModelProvider = ChangeNotifierProvider<HomeViewModel>((ref) {
//   return getIt<HomeViewModel>();
// });

final homeViewModelProvider =
    AsyncNotifierProvider.autoDispose<HomeViewModel, HomeState>(
      // getIt을 호출하는 대신, Notifier 클래스의 인스턴스를 생성
      () => getIt<HomeViewModel>(),
    );
