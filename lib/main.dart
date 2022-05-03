import 'package:flutter/material.dart';

import 'screens/bmi_screen.dart';
import 'screens/intro_screen.dart';

void main() {
  runApp(const GlobalApp());
}

class GlobalApp extends StatelessWidget {
  const GlobalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (context) => const IntroScreen(),
          '/bmi': (context) => const BMIScreen(),
        },
        initialRoute: '/');
  }
}
