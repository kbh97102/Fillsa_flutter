import 'package:flutter/material.dart';
import 'package:presentation/util/extensions.dart';

import '../../util/colors.dart';

class GuideButton extends StatelessWidget {
  final bool isLastPage;

  const GuideButton({super.key, required this.isLastPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        decoration: BoxDecoration(
          color: isLastPage ? purple01 : Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isLastPage ? "필사 시작하기" : "다음",
                style: context.textStyles.buttonM.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
