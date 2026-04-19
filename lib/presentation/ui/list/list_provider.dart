import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../di_config.dart';
import '../../state/quote_list_state.dart';
import '../../viewmodels/list_viewmodel.dart';

final listViewModelProvider =
    AsyncNotifierProvider.autoDispose<ListViewModel, QuoteListState>(
      () => getIt<ListViewModel>(),
    );
