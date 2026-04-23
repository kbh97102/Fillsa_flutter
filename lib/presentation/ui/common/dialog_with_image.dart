import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/ui/common/custom_button.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';

import '../guide/custom_svg.dart';

class DialogWithImage extends StatelessWidget {
  final String svgName;
  final double iconSize;
  final String title;
  final String okText;
  final String? cancelText;
  final VoidCallback onOk;
  final VoidCallback? onCancel;

  static void _noop() {}

  const DialogWithImage({
    super.key,
    required this.svgName,
    this.iconSize = 54,
    required this.title,
    this.okText = '확인',
    this.cancelText,
    this.onOk = _noop,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final colors = FillsaColorScheme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        decoration: BoxDecoration(
          color: colors.backgroundContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            CustomSvg(
              svgName: svgName,
              width: iconSize,
              height: iconSize,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: context.fillsaTypo.heading4.copyWith(
                color: colors.onBackground1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            if (cancelText != null)
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      buttonText: cancelText!,
                      onClick: onCancel ?? () => Navigator.of(context).pop(),
                      backgroundColor: colors.backgroundContainer,
                      textColor: colors.primaryContainer,
                      borderColor: colors.primaryContainer,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomButton(
                      buttonText: okText,
                      onClick: () {
                        Navigator.of(context).pop();
                        onOk();
                      },
                      backgroundColor: colors.primaryContainer,
                      textColor: colors.onPrimaryContainer,
                      borderColor: colors.primaryContainer,
                    ),
                  ),
                ],
              )
            else
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  buttonText: okText,
                  onClick: () {
                    Navigator.of(context).pop();
                    onOk();
                  },
                  backgroundColor: colors.primaryContainer,
                  textColor: colors.onPrimaryContainer,
                  borderColor: colors.primaryContainer,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
