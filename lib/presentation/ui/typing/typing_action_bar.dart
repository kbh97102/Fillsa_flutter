import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/ui/guide/custom_svg.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';

class TypingActionBar extends StatelessWidget {
  final bool isLiked;
  final VoidCallback onCopy;
  final VoidCallback onShare;
  final VoidCallback onLike;
  final VoidCallback onSave;

  const TypingActionBar({
    super.key,
    required this.isLiked,
    required this.onCopy,
    required this.onShare,
    required this.onLike,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final colors = FillsaColorScheme.of(context);
    return Container(
      height: 50,
      color: colors.backgroundContainer,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onCopy,
                child: CustomSvg(svgName: 'icn_copy', width: 24, height: 24),
              ),
              const SizedBox(width: 40),
              GestureDetector(
                onTap: onShare,
                child: CustomSvg(svgName: 'icn_share', width: 24, height: 24),
              ),
              const SizedBox(width: 40),
              GestureDetector(
                onTap: onLike,
                child: CustomSvg(
                  svgName: isLiked ? 'icn_heart_filled' : 'icn_heart',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          _SaveButton(onTap: onSave),
        ],
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  final VoidCallback onTap;

  const _SaveButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = FillsaColorScheme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: colors.onBackground1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '저장하기',
          style: context.fillsaTypo.body3.copyWith(color: colors.onBackground1),
        ),
      ),
    );
  }
}
