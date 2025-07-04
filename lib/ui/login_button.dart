import 'package:fillsa_flutter/util/extensions.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final String svgPath;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const LoginButton({
    super.key,
    required this.text,
    required this.svgPath,
    required this.backgroundColor,
    required this.onPressed,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(svgPath),
            SizedBox(width: 8),
            Text(
              text,
              style: context.textStyles.subtitle2.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
