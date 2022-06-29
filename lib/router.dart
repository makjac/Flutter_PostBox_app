import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_box/cubit/create_parcel_cubit.dart';
import 'package:post_box/cubit/edit_profile_cubit.dart';
import 'package:post_box/cubit/incoming_parcels_cubit.dart';
import 'package:post_box/cubit/login_cubit.dart';
import 'package:post_box/cubit/parcel_history_cubit.dart';
import 'package:post_box/cubit/register_cubit.dart';
import 'package:post_box/data/network_service.dart';
import 'package:post_box/pages/ParcelHistoryScreen.dart';
import 'package:post_box/pages/createParcelScreen.dart';
import 'package:post_box/pages/editProfileScreen.dart';
import 'package:post_box/pages/homeScreen.dart';
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

      case HOME_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      ParcelsCubit(repository: repository!),
                  child: const HomeScreen(),
                ));

      case LOGIN_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      LoginCubit(repository: repository!),
                  child: const LoginPage(),
                ));

      case REGISTER_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      RegisterCubit(repository: repository!),
                  child: const RegisterPage(),
                ));

      case PROFILE_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      ShowcaseCubit(repository: repository!),
                  child: ProfilePage(),
                ));

      case EDIT_PROFILE_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      EditProfileCubit(repository: repository!),
                  child: const EditProfileScreen(),
                ));

      case CREATE_PARCEL_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      CreateParcelCubit(repository: repository!),
                  child: const CreateParcelPage(),
                ));

      case PARCEL_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      ParcelHistoryCubit(repository: repository!),
                  child: ParcelHistoryPage(),
                ));
      default:
        return null;
    }
  }
}
