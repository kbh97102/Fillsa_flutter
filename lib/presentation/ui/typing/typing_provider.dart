import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import '../../../di_config.dart';
import '../../state/TypingState.dart';
import '../../viewmodels/typing_viewmodel.dart';

final typingViewModelProvider =
    NotifierProvider.autoDispose<TypingViewModel, TypingState>(
      () => getIt<TypingViewModel>(),
    );
