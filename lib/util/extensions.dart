import 'package:flutter/material.dart';

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
