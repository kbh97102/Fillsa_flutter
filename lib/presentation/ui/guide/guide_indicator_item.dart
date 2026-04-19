import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:flutter/material.dart';

class GuideIndicatorItem extends StatelessWidget {
  final bool isActive;

  const GuideIndicatorItem({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final colors = FillsaColorScheme.of(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? colors.outline : colors.outlineVariant,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
