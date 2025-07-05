import 'package:fillsa_flutter/util/extensions.dart';
import 'package:flutter/material.dart';

class KoreanEnglishSwitch extends StatefulWidget {
  const KoreanEnglishSwitch({super.key});

  @override
  State<KoreanEnglishSwitch> createState() => _KoreanEnglishSwitchState();
}

class _KoreanEnglishSwitchState extends State<KoreanEnglishSwitch> {
  bool isKorean = true;

  void toggle() => setState(() => isKorean = !isKorean);

  @override
  Widget build(BuildContext context) {
    const double containerWidth = 64;
    const double containerHeight = 28;
    const double thumbWidth = 28;
    const double thumbHeight = 22;
    const Color backgroundColor = Color(0xFFE8E6FB); // 연보라색

    return GestureDetector(
      onTap: toggle,
      child: Container(
        width: containerWidth,
        height: containerHeight,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // ✅ 흰색 thumb (이동 애니메이션)
            AnimatedAlign(
              alignment:
                  isKorean ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: Container(
                width: thumbWidth,
                height: thumbHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),

            // ✅ 텍스트 Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 28,
                  height: 22,
                  child: Center(
                    child: Text("한", style: context.textStyles.buttonXs),
                  ),
                ),
                SizedBox(
                  width: 28,
                  height: 22,
                  child: Center(
                    child: Text("A", style: context.textStyles.buttonXs),
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
