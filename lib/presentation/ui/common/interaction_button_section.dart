import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InteractionButtonSection extends StatelessWidget {
  final bool isLiked;
  final VoidCallback onCopy;
  final VoidCallback onShare;
  final Function(bool) setIsLiked;

  const InteractionButtonSection({
    super.key,
    required this.isLiked,
    required this.onCopy,
    required this.onShare,
    required this.setIsLiked,
  });

  @override
  Widget build(BuildContext context) {
    final colors = FillsaColorScheme.of(context);
    final iconColor = colors.onBackground1;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onCopy,
          child: SvgPicture.asset(
            "assets/images/icn_copy.svg",
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
        ),
        const SizedBox(width: 40),
        GestureDetector(
          onTap: onShare,
          child: SvgPicture.asset(
            "assets/images/icn_share.svg",
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
        ),
        const SizedBox(width: 40),
        GestureDetector(
          onTap: () {
            setIsLiked.call(!isLiked);
          },
          child: isLiked
              ? SvgPicture.asset("assets/images/icn_heart_filled.svg")
              : SvgPicture.asset(
                  "assets/images/icn_heart.svg",
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                ),
        ),
      ],
    );
  }
}
