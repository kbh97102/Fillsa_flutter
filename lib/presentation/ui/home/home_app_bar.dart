import 'package:fillsa_flutter/presentation/util/colors.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';

import '../guide/custom_svg.dart';

class HomeAppBar extends StatelessWidget {
  final int streakDays;

  const HomeAppBar({super.key, required this.streakDays});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: yellow03,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          CustomSvg(svgName: 'img_logo', height: 30),
          const Spacer(),
          Row(
            children: [
              const Text('🔥', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 2),
              Text(
                '${streakDays}일',
                style: context.textStyles.subtitle1,
              ),
            ],
          ),
          const SizedBox(width: 12),
          CustomSvg(svgName: 'icn_mypage', width: 24, height: 24),
        ],
      ),
    );
  }
}
