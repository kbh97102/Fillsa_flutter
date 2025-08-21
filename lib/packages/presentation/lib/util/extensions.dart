import 'package:flutter/material.dart';
import 'package:presentation/util/typo.dart';

import 'custom_font.dart';

extension MyTextStyles on BuildContext {
  MyTypography get textStyles =>
      Theme.of(this).extension<MyTypography>() ?? myTypography;
}

extension HexColor on String {
  Color toColor() {
    final hex = replaceAll('#', '');
    final buffer = StringBuffer();
    if (hex.length == 6) {
      buffer.write('ff'); // alpha 생략 시 불투명 설정
    } else if (hex.length == 8) {
      buffer.write(hex.substring(0, 2)); // alpha 있음
      hex.substring(2);
    }
    buffer.write(hex);
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension ColorAlphaExtension on Color {
  /// 0~100 사이의 퍼센트를 입력받아 알파값을 적용한 Color를 반환합니다.
  Color withOpacityPercent(int percent) {
    assert(percent >= 0 && percent <= 100, 'percent must be between 0 and 100');

    final alpha = ((percent / 100) * 255).round();
    return withAlpha(alpha);
  }
}

extension BuildContextExtension on BuildContext {
  // Theme.of(context).extension<FillsaTypo>()! 로 커스텀 테마를 가져옵니다.
  FillsaTypo get fillsaTypo =>
      Theme.of(this).extension<FillsaTypo>() ?? fillsaTypoData;
}
