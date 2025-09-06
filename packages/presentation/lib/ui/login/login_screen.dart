import 'package:flutter/material.dart';
import 'package:presentation/util/extensions.dart';

import '../../ui/guide/custom_svg.dart';
import '../../ui/login/agreement_text.dart';
import '../../ui/login/login_button_section.dart';
import '../../util/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: yellow03,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 132),
              child: CustomSvg(svgName: "img_logo"),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Text(
                "로그인 후, 나만의 필사를 안전하게 저장할 수 있습니다.",
                style: context.textStyles.body2,
                textAlign: TextAlign.center,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: LoginButtonSection(),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: AgreementText(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
