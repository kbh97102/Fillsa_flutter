import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyPageItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClick;

  const MyPageItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final colors = FillsaColorScheme.of(context);
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          color: colors.backgroundContainer,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colors.tertiaryOutline1),
        ),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        child: Row(
          children: [
            Icon(icon, size: 24, color: colors.onBackground1),
            const SizedBox(width: 8),
            Text(
              text,
              style: context.fillsaTypo.subtitle1.copyWith(
                color: colors.onBackground1,
              ),
            ),
            const Spacer(),
            Transform.rotate(
              angle: 3.1416, // 180° — icn_arrow points left by default
              child: SvgPicture.asset(
                'assets/images/icn_arrow.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  colors.onBackground1,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
