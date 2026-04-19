import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../di_config.dart';
import '../../state/calendar_state.dart';
import '../../viewmodels/calendar_viewmodel.dart';

final calendarViewModelProvider =
    AsyncNotifierProvider.autoDispose<CalendarViewModel, CalendarState>(
      () => getIt<CalendarViewModel>(),
    );
