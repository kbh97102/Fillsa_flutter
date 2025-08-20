import 'package:fillsa_flutter/util/extensions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../util/colors.dart';

class QuoteListItemContent extends StatefulWidget {
  QuoteListItemContent({super.key});

  @override
  State<QuoteListItemContent> createState() => _QuoteListItemContentState();
}

class _QuoteListItemContentState extends State<QuoteListItemContent> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView(
          children: [
            Text("First", style: context.fillsaTypo.body1),
            Text("Second", style: context.fillsaTypo.body1),
          ],
          controller: _pageController,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 20),
          child: SmoothPageIndicator(
            controller: _pageController,
            count: 2,
            onDotClicked: (index) {},
            effect: WormEffect(
              dotWidth: 6,
              dotHeight: 6,
              dotColor: grey200,
              activeDotColor: yellow02,
            ),
          ),
        ),
      ],
    );
  }
}
