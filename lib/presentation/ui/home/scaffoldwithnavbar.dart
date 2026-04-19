import 'package:fillsa_flutter/presentation/theme/fillsa_color_scheme.dart';
import 'package:fillsa_flutter/presentation/ui/list/list_provider.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../guide/custom_svg.dart';
import 'ad_banner.dart';

class ScaffoldWithNavBar extends ConsumerWidget {
  const ScaffoldWithNavBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  static const int _listTabIndex = 1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = FillsaColorScheme.of(context);
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomNavigationBar(
            backgroundColor: colorScheme.background,
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
              if (index == _listTabIndex) {
                ref.invalidate(listViewModelProvider);
              }
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            },
            selectedLabelStyle: context.fillsaTypo.body4.copyWith(
              color: colorScheme.onBackground2,
            ),
            unselectedLabelStyle: context.fillsaTypo.body4.copyWith(
              color: colorScheme.onBackground1,
            ),
          ),
          const AdBanner(),
        ],
      ),
    );
  }
}
