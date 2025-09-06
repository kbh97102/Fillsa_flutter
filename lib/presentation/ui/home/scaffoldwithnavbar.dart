import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../util/colors.dart';
import '../../util/typo.dart';
import '../guide/custom_svg.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({required this.navigationShell, super.key});

  // 이 객체는 go_router가 제공하며, 현재 탭의 인덱스와
  // 탭 변경 함수 등을 포함하고 있습니다.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell, // 여기가 바로 각 탭의 화면이 그려지는 곳입니다.
      bottomNavigationBar: BottomNavigationBar(
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
          // 탭이 선택되었을 때, navigationShell을 사용해 해당 탭으로 이동합니다.
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        selectedLabelStyle: fillsaTypoData.body4.copyWith(color: purple01),
        unselectedLabelStyle: fillsaTypoData.body4,
      ),
    );
  }
}
