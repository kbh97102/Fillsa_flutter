import 'package:fillsa_flutter/ui/login_button.dart';
import 'package:fillsa_flutter/util/colors.dart';
import 'package:flutter/widgets.dart';

class LoginButtonSection extends StatelessWidget {
  const LoginButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        LoginButton(
          text: "카카오 계정으로 시작하기",
          svgPath: "assets/images/icn_kakao.svg",
          backgroundColor: kakaoButtonBackgroundColor,
          textColor: kakaoTextColor,
          onPressed: () => {},
        ),

        LoginButton(
          text: "구글 계정으로 시작하기",
          svgPath: "assets/images/icn_google.svg",
          backgroundColor: googleButtonBackgroundColor,
          onPressed: () => {},
          textColor: grey700,
        ),

        LoginButton(
          text: "비회원으로 시작하기",
          svgPath: "assets/images/icn_non_member.svg",
          backgroundColor: white,
          onPressed: () => {},
          textColor: grey700,
        ),
      ],
    );
  }
}
