import 'package:fillsa_flutter/presentation/util/colors.dart';
import 'package:flutter/material.dart';

@immutable
class FillsaColorScheme extends ThemeExtension<FillsaColorScheme> {
  const FillsaColorScheme({
    required this.background,
    required this.onBackground1,
    required this.onBackground2,
    required this.backgroundContainer,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.outline,
    required this.outlineVariant,
    required this.toastMessageBackground,
    required this.onToastMessage1,
    required this.onToastMessage2,
    required this.backgroundDim,
    required this.secondaryContainer,
    required this.onSecondaryContainer1,
    required this.onSecondaryContainer2,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.tertiaryOutline1,
    required this.tertiaryOutline2,
    required this.tertiary,
    required this.onTertiary1,
    required this.onTertiary2,
  });

  final Color background;
  final Color onBackground1;
  final Color onBackground2;
  final Color backgroundContainer;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color outline;
  final Color outlineVariant;
  final Color toastMessageBackground;
  final Color onToastMessage1;
  final Color onToastMessage2;
  final Color backgroundDim;
  final Color secondaryContainer;
  final Color onSecondaryContainer1;
  final Color onSecondaryContainer2;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color tertiaryOutline1;
  final Color tertiaryOutline2;
  final Color tertiary;
  final Color onTertiary1;
  final Color onTertiary2;

  static const light = FillsaColorScheme(
    background: primary,
    onBackground1: grey700,
    onBackground2: purple01,
    backgroundContainer: white,
    primaryContainer: purple01,
    onPrimaryContainer: white,
    outline: purple01,
    outlineVariant: grey200,
    toastMessageBackground: grey700,
    onToastMessage1: white,
    onToastMessage2: green1a,
    backgroundDim: Color(0xCC212121),
    secondaryContainer: purple02,
    onSecondaryContainer1: grey700,
    onSecondaryContainer2: purple01,
    tertiaryContainer: white,
    onTertiaryContainer: purple01,
    tertiaryOutline1: purple02,
    tertiaryOutline2: purple01,
    tertiary: yellow02,
    onTertiary1: white,
    onTertiary2: purple01,
  );

  static const dark = FillsaColorScheme(
    background: grey700,
    onBackground1: white,
    onBackground2: purple01,
    backgroundContainer: grey600,
    primaryContainer: grey600,
    onPrimaryContainer: white,
    outline: grey500,
    outlineVariant: grey200,
    toastMessageBackground: grey500,
    onToastMessage1: white,
    onToastMessage2: green1a,
    backgroundDim: Color(0xCC212121),
    secondaryContainer: purple02,
    onSecondaryContainer1: grey700,
    onSecondaryContainer2: purple01,
    tertiaryContainer: white,
    onTertiaryContainer: purple01,
    tertiaryOutline1: purple02,
    tertiaryOutline2: purple01,
    tertiary: yellow02,
    onTertiary1: white,
    onTertiary2: purple01,
  );

  static FillsaColorScheme of(BuildContext context) =>
      Theme.of(context).extension<FillsaColorScheme>()!;

  @override
  FillsaColorScheme copyWith({
    Color? background,
    Color? onBackground1,
    Color? onBackground2,
    Color? backgroundContainer,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? outline,
    Color? outlineVariant,
    Color? toastMessageBackground,
    Color? onToastMessage1,
    Color? onToastMessage2,
    Color? backgroundDim,
    Color? secondaryContainer,
    Color? onSecondaryContainer1,
    Color? onSecondaryContainer2,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? tertiaryOutline1,
    Color? tertiaryOutline2,
    Color? tertiary,
    Color? onTertiary1,
    Color? onTertiary2,
  }) {
    return FillsaColorScheme(
      background: background ?? this.background,
      onBackground1: onBackground1 ?? this.onBackground1,
      onBackground2: onBackground2 ?? this.onBackground2,
      backgroundContainer: backgroundContainer ?? this.backgroundContainer,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      toastMessageBackground:
          toastMessageBackground ?? this.toastMessageBackground,
      onToastMessage1: onToastMessage1 ?? this.onToastMessage1,
      onToastMessage2: onToastMessage2 ?? this.onToastMessage2,
      backgroundDim: backgroundDim ?? this.backgroundDim,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer1:
          onSecondaryContainer1 ?? this.onSecondaryContainer1,
      onSecondaryContainer2:
          onSecondaryContainer2 ?? this.onSecondaryContainer2,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      tertiaryOutline1: tertiaryOutline1 ?? this.tertiaryOutline1,
      tertiaryOutline2: tertiaryOutline2 ?? this.tertiaryOutline2,
      tertiary: tertiary ?? this.tertiary,
      onTertiary1: onTertiary1 ?? this.onTertiary1,
      onTertiary2: onTertiary2 ?? this.onTertiary2,
    );
  }

  @override
  FillsaColorScheme lerp(FillsaColorScheme? other, double t) {
    if (other == null) return this;
    return FillsaColorScheme(
      background: Color.lerp(background, other.background, t)!,
      onBackground1: Color.lerp(onBackground1, other.onBackground1, t)!,
      onBackground2: Color.lerp(onBackground2, other.onBackground2, t)!,
      backgroundContainer:
          Color.lerp(backgroundContainer, other.backgroundContainer, t)!,
      primaryContainer:
          Color.lerp(primaryContainer, other.primaryContainer, t)!,
      onPrimaryContainer:
          Color.lerp(onPrimaryContainer, other.onPrimaryContainer, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      outlineVariant: Color.lerp(outlineVariant, other.outlineVariant, t)!,
      toastMessageBackground: Color.lerp(
          toastMessageBackground, other.toastMessageBackground, t)!,
      onToastMessage1: Color.lerp(onToastMessage1, other.onToastMessage1, t)!,
      onToastMessage2: Color.lerp(onToastMessage2, other.onToastMessage2, t)!,
      backgroundDim: Color.lerp(backgroundDim, other.backgroundDim, t)!,
      secondaryContainer:
          Color.lerp(secondaryContainer, other.secondaryContainer, t)!,
      onSecondaryContainer1: Color.lerp(
          onSecondaryContainer1, other.onSecondaryContainer1, t)!,
      onSecondaryContainer2: Color.lerp(
          onSecondaryContainer2, other.onSecondaryContainer2, t)!,
      tertiaryContainer:
          Color.lerp(tertiaryContainer, other.tertiaryContainer, t)!,
      onTertiaryContainer:
          Color.lerp(onTertiaryContainer, other.onTertiaryContainer, t)!,
      tertiaryOutline1:
          Color.lerp(tertiaryOutline1, other.tertiaryOutline1, t)!,
      tertiaryOutline2:
          Color.lerp(tertiaryOutline2, other.tertiaryOutline2, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      onTertiary1: Color.lerp(onTertiary1, other.onTertiary1, t)!,
      onTertiary2: Color.lerp(onTertiary2, other.onTertiary2, t)!,
    );
  }
}
