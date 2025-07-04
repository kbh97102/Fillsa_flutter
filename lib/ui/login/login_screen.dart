import 'package:fillsa_flutter/ui/login/agreement_text.dart';
import 'package:fillsa_flutter/ui/login/login_button_section.dart';
import 'package:fillsa_flutter/util/colors.dart';
import 'package:fillsa_flutter/util/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              child: SvgPicture.asset("assets/images/img_logo.svg"),
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

            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: AgreementText(),
            ),
          ],
        ),
      ),
    );
  }
}
