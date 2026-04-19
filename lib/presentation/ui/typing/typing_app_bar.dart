import 'package:fillsa_flutter/presentation/ui/guide/custom_svg.dart';
import 'package:fillsa_flutter/presentation/ui/home/custom_switch.dart';
import 'package:fillsa_flutter/presentation/util/LocaleOption.dart';
import 'package:flutter/material.dart';

class TypingAppBar extends StatelessWidget {
  final VoidCallback onBack;
  final LocaleOption locale;
  final Function(LocaleOption) onLocaleChange;

  const TypingAppBar({
    super.key,
    required this.onBack,
    required this.locale,
    required this.onLocaleChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onBack,
              child: CustomSvg(svgName: 'icn_arrow', width: 32, height: 32),
            ),
            KoreanEnglishSwitch(
              selected: locale,
              onClick: onLocaleChange,
            ),
          ],
        ),
      ),
    );
  }
}
