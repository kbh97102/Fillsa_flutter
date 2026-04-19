// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $typingRoute,
  $shareRoute,
  $loginRoute,
  $shellRoute,
];

RouteBase get $typingRoute =>
    GoRouteData.$route(path: '/typing', factory: $TypingRoute._fromState);

mixin $TypingRoute on GoRouteData {
  static TypingRoute _fromState(GoRouterState state) =>
      TypingRoute($extra: state.extra as DailyQuoteDto?);

  TypingRoute get _self => this as TypingRoute;

  @override
  String get location => GoRouteData.$location('/typing');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $shareRoute =>
    GoRouteData.$route(path: '/share', factory: $ShareRoute._fromState);

mixin $ShareRoute on GoRouteData {
  static ShareRoute _fromState(GoRouterState state) => ShareRoute();

  @override
  String get location => GoRouteData.$location('/share');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute =>
    GoRouteData.$route(path: '/login', factory: $LoginRoute._fromState);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $shellRoute => StatefulShellRouteData.$route(
  factory: $ShellRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/home',
          factory: $HomeRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: ':date',
              factory: $HomeDateRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/list', factory: $ListRoute._fromState),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/calendar',
          factory: $CalendarRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/mypage',
          factory: $MyPageRoute._fromState,
          routes: [
            GoRouteData.$route(path: 'alert', factory: $AlertRoute._fromState),
            GoRouteData.$route(
              path: 'notice',
              factory: $NoticeRoute._fromState,
            ),
          ],
        ),
      ],
    ),
  ],
);

extension $ShellRouteExtension on ShellRoute {
  static ShellRoute _fromState(GoRouterState state) => const ShellRoute();
}

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $HomeDateRoute on GoRouteData {
  static HomeDateRoute _fromState(GoRouterState state) =>
      HomeDateRoute(date: state.pathParameters['date']!);

  HomeDateRoute get _self => this as HomeDateRoute;

  @override
  String get location =>
      GoRouteData.$location('/home/${Uri.encodeComponent(_self.date)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ListRoute on GoRouteData {
  static ListRoute _fromState(GoRouterState state) =>
      ListRoute(yearMonth: state.uri.queryParameters['year-month']);

  ListRoute get _self => this as ListRoute;

  @override
  String get location => GoRouteData.$location(
    '/list',
    queryParams: {if (_self.yearMonth != null) 'year-month': _self.yearMonth},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CalendarRoute on GoRouteData {
  static CalendarRoute _fromState(GoRouterState state) => const CalendarRoute();

  @override
  String get location => GoRouteData.$location('/calendar');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $MyPageRoute on GoRouteData {
  static MyPageRoute _fromState(GoRouterState state) => const MyPageRoute();

  @override
  String get location => GoRouteData.$location('/mypage');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AlertRoute on GoRouteData {
  static AlertRoute _fromState(GoRouterState state) => const AlertRoute();

  @override
  String get location => GoRouteData.$location('/mypage/alert');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $NoticeRoute on GoRouteData {
  static NoticeRoute _fromState(GoRouterState state) => const NoticeRoute();

  @override
  String get location => GoRouteData.$location('/mypage/notice');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
