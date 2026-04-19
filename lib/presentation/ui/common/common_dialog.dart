import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/ui/common/custom_button.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';

class CommonDialog extends StatelessWidget {
  final String title;
  final String? body;
  final String okButtonText;
  final String cancelButtonText;
  final VoidCallback okButtonOnClick;
  final VoidCallback cancelButtonOnClick;

  static void _defaultCallback() {}

  const CommonDialog({
    super.key,
    required this.title,
    this.okButtonText = "확인",
    this.cancelButtonText = "취소",
    this.okButtonOnClick = _defaultCallback,
    this.cancelButtonOnClick = _defaultCallback,
    this.body,
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),

              // 타이틀
              Text(
                title,
                style: context.fillsaTypo.heading4.copyWith(
                  color: colors.onBackground1,
                ),
                textAlign: TextAlign.center,
              ),
              // 내용
              if (body != null && body!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    body!,
                    style: context.fillsaTypo.body2.copyWith(
                      color: colors.onBackground1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              const SizedBox(height: 24),

              // 버튼
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      buttonText: cancelButtonText,
                      onClick: cancelButtonOnClick,
                      backgroundColor: colors.backgroundContainer,
                      textColor: colors.primaryContainer,
                      borderColor: colors.primaryContainer,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: CustomButton(
                      buttonText: okButtonText,
                      onClick: okButtonOnClick,
                      backgroundColor: colors.primaryContainer,
                      textColor: colors.onPrimaryContainer,
                      borderColor: colors.primaryContainer,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
