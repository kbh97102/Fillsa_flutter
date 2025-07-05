import 'package:fillsa_flutter/ui/common/top_bar.dart';
import 'package:fillsa_flutter/ui/guide/custom_svg.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        startWidget: CustomSvg(svgName: "icn_logo"),
        endWidget: CustomSvg(svgName: "icn_mypage"),
      ),
      body: SafeArea(child: Column()),
    );
  }
}
