import 'package:fillsa_flutter/presentation/ui/common/custom_button.dart';
import 'package:fillsa_flutter/presentation/util/colors.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';

class CommonDialog extends StatelessWidget {
  final String title;
  final String body;
  final String okButtonText;
  final String cancelButtonText;
  final VoidCallback okButtonOnClick;
  final VoidCallback cancelButtonOnClick;
  final Color okButtonColor;
  final Color cancelButtonColor;
  final Color okTextColor;
  final Color cancelTextColor;
  final Color okButtonBorderColor;
  final Color cancelButtonBorderColor;

  static void _defaultCallback() {}

  const CommonDialog({
    super.key,
    required this.title,
    required this.body,
    this.okButtonText = "확인",
    this.cancelButtonText = "취소",
    this.okButtonOnClick = _defaultCallback,
    this.cancelButtonOnClick = _defaultCallback,
    this.okButtonColor = purple01,
    this.cancelButtonColor = white,
    this.okTextColor = white,
    this.cancelTextColor = purple01,
    this.okButtonBorderColor = purple01,
    this.cancelButtonBorderColor = white,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12),

            // 타이틀
            Text(title, style: context.fillsaTypo.heading4),
            // 내용
            Text(body, style: context.fillsaTypo.body2),

            SizedBox(height: 24),

            // 버튼
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    buttonText: cancelButtonText,
                    onClick: cancelButtonOnClick,
                    backgroundColor: cancelButtonColor,
                    textColor: cancelTextColor,
                    borderColor: okButtonBorderColor,
                  ),
                ),

                SizedBox(width: 12),

                Expanded(
                  child: CustomButton(
                    buttonText: okButtonText,
                    onClick: okButtonOnClick,
                    backgroundColor: okButtonColor,
                    textColor: okTextColor,
                    borderColor: cancelButtonBorderColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
