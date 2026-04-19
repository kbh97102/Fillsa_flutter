import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';

class AlertSwitchSection extends StatelessWidget {
  final bool selected;
  final ValueChanged<bool> onChanged;

  const AlertSwitchSection({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = FillsaColorScheme.of(context);
    return Container(
      color: colors.background,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '알림',
                    style: context.fillsaTypo.subtitle1.copyWith(
                      color: colors.onBackground1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '오늘의 필사 알림',
                    style: context.fillsaTypo.body3.copyWith(
                      color: colors.onBackground1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Switch(
            value: selected,
            onChanged: onChanged,
            activeThumbColor: colors.onPrimaryContainer,
            activeTrackColor: colors.primaryContainer,
            inactiveThumbColor: colors.onPrimaryContainer,
            inactiveTrackColor: colors.outlineVariant,
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ],
      ),
    );
  }
}
