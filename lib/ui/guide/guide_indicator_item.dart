import 'package:fillsa_flutter/util/colors.dart';
import 'package:flutter/material.dart';

class GuideIndicatorItem extends StatelessWidget {
  final bool isActive;

  const GuideIndicatorItem({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? purple01 : grey200,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
