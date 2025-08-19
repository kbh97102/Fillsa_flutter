import 'package:fillsa_flutter/ui/calendar/calendar_screen.dart';
import 'package:fillsa_flutter/ui/home/home_screen.dart';
import 'package:fillsa_flutter/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeScreenRoute>(path: "/home/:date")
class HomeScreenRoute extends GoRouteData with _$HomeScreenRoute {
  final String date;

  const HomeScreenRoute({required this.date});

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

@TypedGoRoute<LoginRoute>(path: "/login")
class LoginRoute extends GoRouteData with _$LoginRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => LoginScreen();
}

@TypedGoRoute<CalendarRoute>(path: "/calendar")
class CalendarRoute extends GoRouteData with _$CalendarRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => CalendarScreen();
}
