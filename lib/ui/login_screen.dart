import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 132),
            child: SvgPicture.asset("assets/images/img_logo.svg"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Text("로그인 후, 나만의 필사를 안전하게 저장할 수 있습니다."),
          ),
        ],
      ),
    );
  }
}
