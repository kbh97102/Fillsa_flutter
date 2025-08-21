import 'package:fillsa_flutter/packages/presentation/lib/ui/login/login_screen.dart';
import 'package:fillsa_flutter/packages/presentation/lib/util/routes.dart';
import 'package:fillsa_flutter/packages/presentation/lib/util/typo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';

final fillsaTheme = ThemeData(
  extensions: <ThemeExtension<dynamic>>[fillsaTypoData],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting("ko_KR", null);

  runApp(const MyApp());
  // runApp(DevMain());
}

class DevMain extends StatelessWidget {
  DevMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: fillsaTheme,
      home: SafeArea(
        child: Container(color: Colors.white, child: LoginScreen()),
      ),
    );
  }
}

final _router = GoRouter(
  routes: $appRoutes,
  initialLocation: HomeRoute().location,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: fillsaTheme,
      routerConfig: _router,
      title: "Fillsa",
      supportedLocales: const [Locale('en', 'US'), Locale('ko', 'KR')],
    );
  }
}
