import 'package:fillsa_flutter/ui/common/top_bar.dart';
import 'package:fillsa_flutter/util/colors.dart';
import 'package:fillsa_flutter/util/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    );
  }
}
