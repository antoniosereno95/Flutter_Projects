import 'package:flutter/material.dart';

import 'homePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //essa classe [e onde fica todas as coisas do app
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}