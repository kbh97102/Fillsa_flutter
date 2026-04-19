import 'package:fillsa_flutter/presentation/ui/list/quote_list_item.dart';
import 'package:fillsa_flutter/presentation/util/routes.dart';
import 'package:fillsa_flutter/presentation/util/typo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';

import 'di_config.dart';
import 'firebase_options.dart';

final fillsaTheme = ThemeData(
  extensions: <ThemeExtension<dynamic>>[fillsaTypoData],
);

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: "local_properties.env");
  KakaoSdk.init(nativeAppKey: dotenv.get("KAKAO_KEY"));
  await initializeDateFormatting("ko_KR", null);

  runApp(const ProviderScope(child: MyApp()));
}

class DevMain extends StatelessWidget {
  DevMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: fillsaTheme,
      home: SafeArea(
        child: Container(color: Colors.white, child: QuoteListItem()),
      ),
    );
  }
}

final _router = GoRouter(
  routes: $appRoutes,
  initialLocation: LoginRoute().location,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: fillsaTheme,
      routerConfig: _router,
      title: "Fillsa",
      supportedLocales: const [Locale('en', 'US'), Locale('ko', 'KR')],
    );
  }
}
