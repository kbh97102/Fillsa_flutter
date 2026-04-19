import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/util/typo.dart';
import 'package:flutter/material.dart';

final ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  extensions: <ThemeExtension<dynamic>>[
    fillsaTypoData,
    FillsaColorScheme.light,
  ],
);

final ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  extensions: <ThemeExtension<dynamic>>[
    fillsaTypoData,
    FillsaColorScheme.dark,
  ],
);
