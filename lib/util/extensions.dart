import 'package:flutter/material.dart';

import 'custom_font.dart';

extension MyTextStyles on BuildContext {
  MyTypography get textStyles =>
      Theme.of(this).extension<MyTypography>() ?? myTypography;
}
