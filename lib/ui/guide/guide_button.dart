import 'package:fillsa_flutter/util/colors.dart';
import 'package:fillsa_flutter/util/extensions.dart';
import 'package:flutter/material.dart';

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
