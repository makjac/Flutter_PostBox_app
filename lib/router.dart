import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_box/data/network_service.dart';
import 'package:post_box/pages/pages_base.dart';
import 'package:post_box/constans/strings.dart';
import 'package:post_box/cubit/showcase_cubit.dart';
import 'package:post_box/data/repository.dart';

class AppRouter {
  Repository? repository;

  AppRouter() {
    repository = Repository(networkService: NetworkService());
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case START_ROUTE:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case LOGIN_ROUTE:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case REGISTER_ROUTE:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case PROFILE_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      ShowcaseCubit(repository: repository!),
                  child: ProfilePage(),
                ));
      default:
        return null;
    }
  }
}
