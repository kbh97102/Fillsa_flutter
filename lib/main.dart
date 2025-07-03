import 'package:fillsa_flutter/ui/login_screen.dart';
import 'package:fillsa_flutter/util/custom_font.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        extensions: <ThemeExtension<dynamic>>[myTypography],
      ),
      home: const LoginScreen(),
    );
  }
}
