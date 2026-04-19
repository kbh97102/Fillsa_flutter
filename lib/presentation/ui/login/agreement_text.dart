import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AgreementText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = FillsaColorScheme.of(context).onBackground1;
    final defaultStyle = context.fillsaTypo.body3.copyWith(color: color);
    final linkStyle = context.fillsaTypo.subtitle2.copyWith(
      color: color,
      decoration: TextDecoration.underline,
    );

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: defaultStyle,
        children: [
          const TextSpan(text: '로그인 시, '),
          TextSpan(
            text: '이용약관',
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // TODO: 이용약관 페이지 이동
              },
          ),
          const TextSpan(text: ' 및 '),
          TextSpan(
            text: '개인정보 처리방침',
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // TODO: 개인정보 처리방침 페이지 이동
              },
          ),
          const TextSpan(text: '에 동의하는 것으로 간주됩니다.'),
        ],
      ),
    );
  }
}
