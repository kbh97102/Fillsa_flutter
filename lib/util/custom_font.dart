import 'package:flutter/material.dart';

import 'colors.dart';

class MyTypography extends ThemeExtension<MyTypography> {
  final TextStyle heading1;
  final TextStyle heading2;
  final TextStyle heading3;
  final TextStyle heading4;
  final TextStyle subtitle1;
  final TextStyle subtitle2;
  final TextStyle body1;
  final TextStyle body2;
  final TextStyle body3;
  final TextStyle body4;
  final TextStyle buttonL;
  final TextStyle buttonM;
  final TextStyle buttonS;
  final TextStyle buttonXs;

  const MyTypography({
    required this.heading1,
    required this.heading2,
    required this.heading3,
    required this.heading4,
    required this.subtitle1,
    required this.subtitle2,
    required this.body1,
    required this.body2,
    required this.body3,
    required this.body4,
    required this.buttonL,
    required this.buttonM,
    required this.buttonS,
    required this.buttonXs,
  });

  @override
  MyTypography copyWith({
    TextStyle? heading1,
    TextStyle? heading2,
    TextStyle? heading3,
    TextStyle? heading4,
    TextStyle? subtitle1,
    TextStyle? subtitle2,
    TextStyle? body1,
    TextStyle? body2,
    TextStyle? body3,
    TextStyle? body4,
    TextStyle? buttonL,
    TextStyle? buttonM,
    TextStyle? buttonS,
    TextStyle? buttonXs,
  }) {
    return MyTypography(
      heading1: heading1 ?? this.heading1,
      heading2: heading2 ?? this.heading2,
      heading3: heading3 ?? this.heading3,
      heading4: heading4 ?? this.heading4,
      subtitle1: subtitle1 ?? this.subtitle1,
      subtitle2: subtitle2 ?? this.subtitle2,
      body1: body1 ?? this.body1,
      body2: body2 ?? this.body2,
      body3: body3 ?? this.body3,
      body4: body4 ?? this.body4,
      buttonL: buttonL ?? this.buttonL,
      buttonM: buttonM ?? this.buttonM,
      buttonS: buttonS ?? this.buttonS,
      buttonXs: buttonXs ?? this.buttonXs,
    );
  }

  @override
  MyTypography lerp(ThemeExtension<MyTypography>? other, double t) {
    if (other is! MyTypography) return this;
    return MyTypography(
      heading1: TextStyle.lerp(heading1, other.heading1, t)!,
      heading2: TextStyle.lerp(heading2, other.heading2, t)!,
      heading3: TextStyle.lerp(heading3, other.heading3, t)!,
      heading4: TextStyle.lerp(heading4, other.heading4, t)!,
      subtitle1: TextStyle.lerp(subtitle1, other.subtitle1, t)!,
      subtitle2: TextStyle.lerp(subtitle2, other.subtitle2, t)!,
      body1: TextStyle.lerp(body1, other.body1, t)!,
      body2: TextStyle.lerp(body2, other.body2, t)!,
      body3: TextStyle.lerp(body3, other.body3, t)!,
      body4: TextStyle.lerp(body4, other.body4, t)!,
      buttonL: TextStyle.lerp(buttonL, other.buttonL, t)!,
      buttonM: TextStyle.lerp(buttonM, other.buttonM, t)!,
      buttonS: TextStyle.lerp(buttonS, other.buttonS, t)!,
      buttonXs: TextStyle.lerp(buttonXs, other.buttonXs, t)!,
    );
  }
}

var myTypography = MyTypography(
  heading1: TextStyle(
    fontSize: 32,
    height: 48 / 32,
    fontWeight: FontWeight.bold,
    color: grey700,
  ),
  heading2: TextStyle(
    fontSize: 28,
    height: 42 / 28,
    fontWeight: FontWeight.bold,
    color: grey700,
  ),
  heading3: TextStyle(
    fontSize: 24,
    height: 36 / 24,
    fontWeight: FontWeight.bold,
    color: grey700,
  ),
  heading4: TextStyle(
    fontSize: 20,
    height: 30 / 20,
    fontWeight: FontWeight.bold,
    color: grey700,
  ),
  subtitle1: TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.bold,
    color: grey700,
  ),
  subtitle2: TextStyle(
    fontSize: 14,
    height: 21 / 14,
    fontWeight: FontWeight.bold,
    color: grey700,
  ),
  body1: TextStyle(
    fontSize: 20,
    height: 30 / 20,
    fontWeight: FontWeight.w400,
    color: grey700,
  ),
  body2: TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w400,
    color: grey700,
  ),
  body3: TextStyle(
    fontSize: 14,
    height: 21 / 14,
    fontWeight: FontWeight.w400,
    color: grey700,
  ),
  body4: TextStyle(
    fontSize: 12,
    height: 18 / 12,
    fontWeight: FontWeight.w400,
    color: grey700,
  ),
  buttonL: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: grey700),
  buttonM: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: grey700),
  buttonS: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: grey700),
  buttonXs: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: grey700,
  ),
);
