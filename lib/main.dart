import 'package:flutter/material.dart';

import 'pages/pages_base.dart';

void main() {
  runApp(MaterialApp(
    title: 'PostBox',
    //home: MyApp(),
    initialRoute: '/',
    routes: {
      '/': (context) => const StartScreen(),
      '/login': (context) => const LoginFormPage(),
      '/register': (context) => const RegisterFormPage(),
    },
  ));
}
