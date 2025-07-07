import 'package:fillsa_flutter/ui/calendar/calendar_screen.dart';
import 'package:fillsa_flutter/util/custom_font.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting("ko_KR", null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [Locale('en', 'US'), Locale('ko', 'KR')],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        extensions: <ThemeExtension<dynamic>>[myTypography],
      ),
      // home: const LoginScreen(),
      home: SafeArea(child: const CalendarScreen()),
    );
  }
}
