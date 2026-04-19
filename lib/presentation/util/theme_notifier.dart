import 'package:fillsa_flutter/di_config.dart';
import 'package:fillsa_flutter/domain/usecase/get_theme_mode_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/set_theme_mode_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider = AsyncNotifierProvider<ThemeNotifier, ThemeMode>(
  () => ThemeNotifier(),
);

class ThemeNotifier extends AsyncNotifier<ThemeMode> {
  @override
  Future<ThemeMode> build() async {
    final raw = await getIt<GetThemeModeUseCase>().call();
    return _fromString(raw);
  }

  Future<void> setMode(ThemeMode mode) async {
    await getIt<SetThemeModeUseCase>().call(_toString(mode));
    state = AsyncValue.data(mode);
  }

  static ThemeMode _fromString(String? value) => switch (value) {
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        _ => ThemeMode.light,
      };

  static String _toString(ThemeMode mode) => switch (mode) {
        ThemeMode.light => 'light',
        ThemeMode.dark => 'dark',
        ThemeMode.system => 'system',
      };
}
