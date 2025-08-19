import 'package:fillsa_flutter/ui/calendar/calendar_screen.dart';
import 'package:fillsa_flutter/ui/home/home_screen.dart';
import 'package:fillsa_flutter/ui/home/scaffoldwithnavbar.dart';
import 'package:fillsa_flutter/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<LoginRoute>(path: "/login")
class LoginRoute extends GoRouteData with _$LoginRoute {
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

class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeScreen();
  }
}

class HomeDateRoute extends GoRouteData with _$HomeDateRoute {
  const HomeDateRoute({required this.date});
  final String date;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeScreen();
  }
}

@TypedGoRoute<CalendarRoute>(path: "/calendar")
class CalendarRoute extends GoRouteData with _$CalendarRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => CalendarScreen();
}

class HomeScreenBranch extends StatefulShellBranchData {
  const HomeScreenBranch();
}

class CalendarScreenBranch extends StatefulShellBranchData {
  const CalendarScreenBranch();
}
