import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';

class ThemeDialog extends StatefulWidget {
  final ThemeMode current;
  final ValueChanged<ThemeMode> onChanged;

  const ThemeDialog({super.key, required this.current, required this.onChanged});

  @override
  State<ThemeDialog> createState() => _ThemeDialogState();
}

class _ThemeDialogState extends State<ThemeDialog> {
  late ThemeMode _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.current;
  }

  @override
  Widget build(BuildContext context) {
    final colors = FillsaColorScheme.of(context);
    return Dialog(
      backgroundColor: colors.backgroundContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ThemeItem(
              label: '라이트',
              selected: _selected == ThemeMode.light,
              onTap: () => setState(() => _selected = ThemeMode.light),
            ),
            const SizedBox(height: 16),
            _ThemeItem(
              label: '다크',
              selected: _selected == ThemeMode.dark,
              onTap: () => setState(() => _selected = ThemeMode.dark),
            ),
            const SizedBox(height: 16),
            _ThemeItem(
              label: '시스템',
              selected: _selected == ThemeMode.system,
              onTap: () => setState(() => _selected = ThemeMode.system),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primaryContainer,
                  foregroundColor: colors.onPrimaryContainer,
                ),
                onPressed: () {
                  widget.onChanged(_selected);
                  Navigator.of(context).pop();
                },
                child: Text(
                  '확인',
                  style: context.fillsaTypo.buttonMediumBold.copyWith(
                    color: colors.onPrimaryContainer,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeItem extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ThemeItem({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = FillsaColorScheme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.fillsaTypo.subtitle1.copyWith(
              color: colors.onBackground1,
            ),
          ),
          Icon(
            selected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
            color: selected ? colors.onBackground2 : colors.outlineVariant,
          ),
        ],
      ),
    );
  }
}
