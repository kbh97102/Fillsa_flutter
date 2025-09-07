import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../di_config.dart';
import '../../viewmodels/home_viewmodel.dart';

final homeViewModelProvider = Provider((ref) {
  return getIt<HomeViewModel>();
});
