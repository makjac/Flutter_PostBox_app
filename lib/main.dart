import 'package:flutter/material.dart';

import 'pages/pages_base.dart';
import 'package:post_box/utils/userSharedPreferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserSharedPreferences.init();

  runApp(MaterialApp(
    title: 'PostBox',
    initialRoute: '/welcome',
    routes: {
      '/welcome': (context) => const StartScreen(),
      '/login': (context) => const LoginFormPage(),
      '/register': (context) => const RegisterFormPage(),
      '/home': (context) => const HomePage(),
    },
  ));
}
