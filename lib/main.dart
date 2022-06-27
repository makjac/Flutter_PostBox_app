// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:post_box/router.dart';
import 'package:post_box/utils/userSharedPreferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserSharedPreferences.init();

  runApp(PostBoxApp(
    router: AppRouter(),
  ));
}

class PostBoxApp extends StatelessWidget {
  final AppRouter router;

  const PostBoxApp({
    Key? key,
    required this.router,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
