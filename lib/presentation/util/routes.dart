import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/calendar/calendar_screen.dart';
import '../ui/home/home_screen.dart';
import '../ui/home/scaffoldwithnavbar.dart';
import '../ui/login/login_screen.dart';
import '../ui/share/share_screen.dart';
import '../ui/typing/typing_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<TypingRoute>(path: "/typing")
class TypingRoute extends GoRouteData with $TypingRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TypingScreen();
}

@TypedGoRoute<ShareRoute>(path: "/share")
class ShareRoute extends GoRouteData with $ShareRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ShareScreen();
}

@TypedGoRoute<LoginRoute>(path: "/login")
class LoginRoute extends GoRouteData with $LoginRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => LoginScreen();
}

@TypedStatefulShellRoute<ShellRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeScreenBranch>(
      routes: <TypedGoRoute<GoRouteData>>[
        TypedGoRoute<HomeRoute>(
          path: '/home',
          routes: <TypedGoRoute<GoRouteData>>[
            TypedGoRoute<HomeDateRoute>(path: ':date'),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<CalendarScreenBranch>(
      routes: <TypedGoRoute<GoRouteData>>[
        TypedGoRoute<CalendarRoute>(path: '/calendar'),
      ],
    ),
  ],
)
class ShellRoute extends StatefulShellRouteData {
  const ShellRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return ScaffoldWithNavBar(navigationShell: navigationShell);
  }
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeScreen();
  }
}

class HomeDateRoute extends GoRouteData with $HomeDateRoute {
  const HomeDateRoute({required this.date});
  final String date;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeScreen();
  }
}

@TypedGoRoute<CalendarRoute>(path: "/calendar")
class CalendarRoute extends GoRouteData with $CalendarRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => CalendarScreen();
}

class HomeScreenBranch extends StatefulShellBranchData {
  const HomeScreenBranch();
}

class CalendarScreenBranch extends StatefulShellBranchData {
  const CalendarScreenBranch();
}
