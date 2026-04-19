import 'package:fillsa_flutter/presentation/ui/guide/custom_svg.dart';
import 'package:fillsa_flutter/presentation/util/colors.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';

class TypingActionBar extends StatelessWidget {
  final VoidCallback onExit;
  final bool isLiked;
  final VoidCallback onCopy;
  final VoidCallback onShare;
  final VoidCallback onLike;

  const TypingActionBar({
    super.key,
    required this.onExit,
    required this.isLiked,
    required this.onCopy,
    required this.onShare,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _ExitButton(onTap: onExit),
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
        ],
      ),
    );
  }
}

class _ExitButton extends StatelessWidget {
  final VoidCallback onTap;

  const _ExitButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: grey700),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '나가기',
          style: context.fillsaTypo.body3.copyWith(color: grey700),
        ),
      ),
    );
  }
}
