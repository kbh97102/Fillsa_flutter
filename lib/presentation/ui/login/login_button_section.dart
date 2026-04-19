import 'package:fillsa_flutter/presentation/util/colors.dart';
import 'package:fillsa_flutter/presentation/util/routes.dart';
import 'package:flutter/widgets.dart';

import 'login_button.dart';

class LoginButtonSection extends StatelessWidget {
  final VoidCallback doGoogleLogin;
  final VoidCallback doKakaoLogin;

  const LoginButtonSection({
    super.key,
    required this.doGoogleLogin,
    required this.doKakaoLogin,
  });

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
          onPressed: doKakaoLogin,
        ),

        LoginButton(
          text: "구글 계정으로 시작하기",
          svgPath: "assets/images/icn_google.svg",
          backgroundColor: googleButtonBackgroundColor,
          textColor: kakaoTextColor,
          onPressed: doGoogleLogin,
        ),

        LoginButton(
          text: "비회원으로 시작하기",
          svgPath: "assets/images/icn_non_member.svg",
          backgroundColor: white,
          textColor: kakaoTextColor,
          onPressed: () => HomeRoute().go(context),
        ),
      ],
    );
  }
}
