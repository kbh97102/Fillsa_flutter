import 'package:fillsa_flutter/ui/guide/custom_svg.dart';
import 'package:fillsa_flutter/ui/list/custom_checkbox.dart';
import 'package:fillsa_flutter/util/colors.dart';
import 'package:fillsa_flutter/util/extensions.dart';
import 'package:flutter/material.dart';

class LikeFilter extends StatefulWidget {
  final bool isLiked;
  final void Function(bool) setIsLike;
  const LikeFilter({super.key, required this.isLiked, required this.setIsLike});

  @override
  State<LikeFilter> createState() => _LikeFilterState();
}

class _LikeFilterState extends State<LikeFilter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomSvg(svgName: "icn_heart_fill"),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            "좋아요",
            style: context.fillsaTypo.buttonMediumNormal.copyWith(
              color: grey700,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: CustomCheckbox(isLiked: true, setIsLike: (bool) {}, size: 24),
        ),
      ],
    );
  }
}
