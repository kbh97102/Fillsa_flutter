import 'package:fillsa_flutter/presentation/ui/login/login_result.dart';
import 'package:fillsa_flutter/presentation/ui/login/login_viewmodel_provider.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:fillsa_flutter/presentation/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../util/colors.dart';
import '../guide/custom_svg.dart';
import 'agreement_text.dart';
import 'login_button_section.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(loginViewModelProvider, (previous, next) {
      if (next is AsyncData && next.value != null) {
        switch (next.value) {
          case LoginSuccess():
            {
              HomeRoute().go(context);
            }
        }
      }

      if (next is AsyncError) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('로그인 실패'),
            content: Text(next.error.toString()), // 실제 에러 메시지 표시
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('확인'),
              ),
            ],
          ),
        );
      }
    });

    return Container(
      color: yellow03,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 162),
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
              child: LoginButtonSection(
                doGoogleLogin: () {
                  ref.read(loginViewModelProvider.notifier).signInWithGoogle();
                },
                doKakaoLogin: () {
                  ref.read(loginViewModelProvider.notifier).signInWithKakao();
                },
              ),
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
