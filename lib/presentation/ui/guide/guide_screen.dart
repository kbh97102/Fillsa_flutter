import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/top_bar.dart';
import 'guide_button.dart';
import 'guide_image_section.dart';
import 'guide_indicator.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = FillsaColorScheme.of(context);

    return Scaffold(
      appBar: TopBar(
        startWidget: SvgPicture.asset(
          "assets/images/icn_arrow.svg",
          colorFilter: ColorFilter.mode(colors.onBackground1, BlendMode.srcIn),
        ),
        endWidget: GestureDetector(
          onTap: () {
            // TODO: 건너뛰기 동작 연결
          },
          child: Text(
            "건너뛰기",
            style: context.fillsaTypo.body3.copyWith(
              color: colors.onBackground1,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          GuideIndicator(),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "필사, 이렇게 사용하면 편리해요🖋️",
              style: context.fillsaTypo.heading4.copyWith(
                color: colors.onBackground1,
              ),
            ),
          ),
          Expanded(child: GuideImageSection()),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GuideButton(isLastPage: false),
          ),
        ],
      ),
    );
  }
}
