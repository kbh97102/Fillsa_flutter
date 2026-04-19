import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareScreen extends StatelessWidget {
  final String quote;
  final String author;
  final VoidCallback? popBackStack;

  const ShareScreen({
    super.key,
    this.quote = "",
    this.author = "",
    this.popBackStack,
  });

  @override
  Widget build(BuildContext context) {
    final colors = FillsaColorScheme.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Column(
          children: [
            // 상단 뒤로가기 버튼
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: popBackStack ?? () => Navigator.of(context).pop(),
                    child: SvgPicture.asset(
                      "assets/images/icn_arrow.svg",
                      colorFilter: ColorFilter.mode(
                        colors.onBackground1,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 타이틀 영역
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Text(
                    "공유하기",
                    style: context.fillsaTypo.heading4.copyWith(
                      color: colors.onBackground1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "원하는 배경을 선택해 공유해보세요",
                    style: context.fillsaTypo.body2.copyWith(
                      color: colors.onBackground1,
                    ),
                  ),
                ],
              ),
            ),

            // 이미지 페이저 영역 (추후 구현)
            const Expanded(
              child: Center(
                child: Text("추후 구현"),
              ),
            ),

            // 하단 버튼 영역 (추후 구현)
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
