import 'package:fillsa_flutter/domain/model/response/DailyQuoteDto.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/calendar/calendar_screen.dart';
import '../ui/home/home_screen.dart';
import '../ui/home/scaffoldwithnavbar.dart';
import '../ui/list/quote_list_screen.dart';
import '../ui/login/login_screen.dart';
import '../ui/share/share_screen.dart';
import '../ui/typing/typing_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<TypingRoute>(path: "/typing")
class TypingRoute extends GoRouteData with $TypingRoute {
  final DailyQuoteDto? $extra;

  const TypingRoute({this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      TypingScreen(dailyQuoteDto: $extra);
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
    TypedStatefulShellBranch<ListScreenBranch>(
      routes: <TypedGoRoute<GoRouteData>>[
        TypedGoRoute<ListRoute>(path: '/list'),
      ],
    ),
    TypedStatefulShellBranch<CalendarScreenBranch>(
      routes: <TypedGoRoute<GoRouteData>>[
        TypedGoRoute<CalendarRoute>(path: '/calendar'),
      ],
    ),
    TypedStatefulShellBranch<MyPageScreenBranch>(
      routes: <TypedGoRoute<GoRouteData>>[
        TypedGoRoute<MyPageRoute>(path: '/mypage'),
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
  Widget build(BuildContext context, GoRouterState state) => HomeScreen();
}

class HomeDateRoute extends GoRouteData with $HomeDateRoute {
  const HomeDateRoute({required this.date});
  final String date;

  @override
  Widget build(BuildContext context, GoRouterState state) => HomeScreen();
}

class ListRoute extends GoRouteData with $ListRoute {
  const ListRoute({this.yearMonth});
  final String? yearMonth;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      QuoteListScreen(yearMonth: yearMonth);
}

class CalendarRoute extends GoRouteData with $CalendarRoute {
  const CalendarRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CalendarScreen();
}

class MyPageRoute extends GoRouteData with $MyPageRoute {
  const MyPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const Scaffold(
        body: Center(child: Text('마이페이지 준비중')),
      );
}

class HomeScreenBranch extends StatefulShellBranchData {
  const HomeScreenBranch();
}

class ListScreenBranch extends StatefulShellBranchData {
  const ListScreenBranch();
}

class CalendarScreenBranch extends StatefulShellBranchData {
  const CalendarScreenBranch();
}

class MyPageScreenBranch extends StatefulShellBranchData {
  const MyPageScreenBranch();
}
