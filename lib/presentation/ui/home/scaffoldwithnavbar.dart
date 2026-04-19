import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../util/colors.dart';
import '../../util/typo.dart';
import '../guide/custom_svg.dart';
import 'ad_banner.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomNavigationBar(
            backgroundColor: yellow03,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: CustomSvg(svgName: "icn_nav_home"),
                activeIcon: CustomSvg(svgName: "icn_nav_home_active"),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: CustomSvg(svgName: "icn_nav_list"),
                activeIcon: CustomSvg(svgName: "icn_nav_list_active"),
                label: 'List',
              ),
              BottomNavigationBarItem(
                icon: CustomSvg(svgName: "icn_nav_calendar"),
                activeIcon: CustomSvg(svgName: "icn_nav_calendar_active"),
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon: CustomSvg(svgName: "icn_nav_mypage"),
                activeIcon: CustomSvg(svgName: "icn_nav_mypage_active"),
                label: 'My page',
              ),
            ],
            currentIndex: navigationShell.currentIndex,
            onTap: (int index) {
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            },
            selectedLabelStyle: fillsaTypoData.body4.copyWith(color: purple01),
            unselectedLabelStyle: fillsaTypoData.body4,
          ),
          const AdBanner(),
        ],
      ),
    );
  }
}
