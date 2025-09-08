import 'package:fillsa_flutter/presentation/util/colors.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String buttonText;
  final double buttonRadius;
  final Function onClick;
  final Color borderColor;

  const CustomButton({
    super.key,
    required this.buttonText,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.white,
    this.textColor = grey700,
    this.buttonRadius = 8,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
          side: BorderSide(color: borderColor, width: 1.0),
        ),
      ),

      onPressed: () => onClick(),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 15),
        child: Text(
          buttonText,
          style: context.fillsaTypo.buttonMediumBold.copyWith(color: textColor),
        ),
      ),
    );
  }
}
