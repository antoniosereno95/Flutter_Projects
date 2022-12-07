

import 'package:flutter/material.dart';
import 'homePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "App Modulo 01",
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder()
            }
            )
      ),
        home: const HomePage(title: "Modulo 01 Home Page"));
  }
}
