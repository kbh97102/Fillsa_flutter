import 'package:flutter/material.dart';

import 'colors.dart';

class FillsaTypo extends ThemeExtension<FillsaTypo> {
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
  final TextStyle buttonLargeBold;
  final TextStyle buttonLargeNormal;
  final TextStyle buttonMediumBold;
  final TextStyle buttonMediumNormal;
  final TextStyle buttonSmallBold;
  final TextStyle buttonSmallNormal;
  final TextStyle buttonXSmallBold;
  final TextStyle buttonXSmallNormal;
  final TextStyle quote;

  const FillsaTypo({
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
    required this.buttonLargeBold,
    required this.buttonLargeNormal,
    required this.buttonMediumBold,
    required this.buttonMediumNormal,
    required this.buttonSmallBold,
    required this.buttonSmallNormal,
    required this.buttonXSmallBold,
    required this.buttonXSmallNormal,
    required this.quote,
  });

  @override
  ThemeExtension<FillsaTypo> copyWith() {
    return this;
  }

  @override
  ThemeExtension<FillsaTypo> lerp(
    covariant ThemeExtension<FillsaTypo>? other,
    double t,
  ) {
    return this;
  }
}

// 2. 앱 전체에서 사용될 실제 텍스트 스타일 객체
final fillsaTypoData = FillsaTypo(
  heading1: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'pretendard',
    fontSize: 32.0,
    height: 1.5,
    color: grey700,
  ), // 48 / 32
  heading2: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'pretendard',
    fontSize: 28.0,
    height: 1.5,
    color: grey700,
  ), // 42 / 28
  heading3: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'pretendard',
    fontSize: 24.0,
    height: 1.5,
    color: grey700,
  ), // 36 / 24
  heading4: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'pretendard',
    fontSize: 20.0,
    height: 1.5,
    color: grey700,
  ), // 30 / 20
  subtitle1: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'pretendard',
    fontSize: 16.0,
    height: 1.5,
    color: grey700,
  ), // 24 / 16
  subtitle2: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'pretendard',
    fontSize: 14.0,
    height: 1.5,
    color: grey700,
  ), // 21 / 14
  body1: TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'pretendard',
    fontSize: 20.0,
    height: 1.5,
    color: grey700,
  ), // 30 / 20
  body2: TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'pretendard',
    fontSize: 16.0,
    height: 1.5,
    color: grey700,
  ), // 24 / 16
  body3: TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'pretendard',
    fontSize: 14.0,
    height: 1.5,
    color: grey700,
  ), // 21 / 14
  body4: TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'pretendard',
    fontSize: 12.0,
    height: 1.5,
    color: grey700,
  ), // 18 / 12
  buttonLargeBold: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'pretendard',
    fontSize: 20.0,
    color: grey700,
  ),
  buttonLargeNormal: TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'pretendard',
    fontSize: 20.0,
    color: grey700,
  ),
  buttonMediumBold: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'pretendard',
    fontSize: 16.0,
    color: grey700,
  ),
  buttonMediumNormal: TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'pretendard',
    fontSize: 16.0,
    color: grey700,
  ),
  buttonSmallBold: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'pretendard',
    fontSize: 14.0,
    color: grey700,
  ),
  buttonSmallNormal: TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'pretendard',
    fontSize: 14.0,
    color: grey700,
  ),
  buttonXSmallBold: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'pretendard',
    fontSize: 12.0,
    color: grey700,
  ),
  buttonXSmallNormal: TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'pretendard',
    fontSize: 12.0,
    color: grey700,
  ),
  quote: TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'gangwoneduall',
    fontSize: 16.0,
    height: 1.5,
    color: grey700,
  ), // 24 / 16
);
