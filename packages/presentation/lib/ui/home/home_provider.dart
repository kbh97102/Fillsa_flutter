import 'package:fillsa_flutter/di_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodels/home_viewmodel.dart';

final homeViewModelProvider = Provider((ref) {
  return getIt<HomeViewModel>();
});
