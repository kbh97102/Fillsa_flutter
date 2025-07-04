import 'package:fillsa_flutter/util/colors.dart';
import 'package:fillsa_flutter/util/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AgreementText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final defaultStyle = context.textStyles.body3.copyWith(color: grey500);
    final linkStyle = context.textStyles.subtitle2.copyWith(
      color: grey500,
      decoration: TextDecoration.underline,
    );

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: defaultStyle,
        children: [
          TextSpan(text: '로그인 시, '),
          TextSpan(
            text: '이용약관',
            style: linkStyle,
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    // TODO: 이용약관 페이지 이동
                    print('이용약관 클릭됨');
                  },
          ),
          TextSpan(text: ' 및 '),
          TextSpan(
            text: '개인정보 처리방침',
            style: linkStyle,
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    // TODO: 개인정보 처리방침 페이지 이동
                    print('개인정보 처리방침 클릭됨');
                  },
          ),
          TextSpan(text: '에 동의하는 것으로 간주됩니다.'),
        ],
      ),
    );
  }
}
