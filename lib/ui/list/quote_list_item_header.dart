import 'package:fillsa_flutter/util/extensions.dart';
import 'package:flutter/material.dart';

class QuoteListItemHeader extends StatelessWidget {
  const QuoteListItemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFD7D6FF), // 배경 색상
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ), // 둥근 모서리
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("2025.03.25", style: context.fillsaTypo.buttonXSmallBold),
          const SizedBox(width: 6),
          Text("(수)", style: context.fillsaTypo.buttonXSmallNormal),
        ],
      ),
    );
  }
}
