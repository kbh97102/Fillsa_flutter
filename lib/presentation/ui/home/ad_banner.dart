import 'package:flutter/material.dart';

import '../../util/colors.dart';
import '../../util/typo.dart';

class AdBanner extends StatelessWidget {
  const AdBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      color: yellow03,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: grey700,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              'AD',
              style: fillsaTypoData.body4.copyWith(color: white),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '광고가 들어가는 영역입니다.',
            style: fillsaTypoData.body4,
          ),
        ],
      ),
    );
  }
}
