import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../util/colors.dart';
import '../common/top_bar.dart';
import 'guide_button.dart';
import 'guide_image_section.dart';
import 'guide_indicator.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        startWidget: SvgPicture.asset("assets/images/icn_arrow.svg"),
        endWidget: Text(
          "건너뛰기",
          style: context.textStyles.body3.copyWith(
            color: grey500,
            decoration: TextDecoration.underline,
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
              style: context.textStyles.heading4.copyWith(color: Colors.black),
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
