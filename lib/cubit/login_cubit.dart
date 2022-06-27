// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:post_box/data/repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Repository repository;

  LoginCubit({
    required this.repository,
  }) : super(LoginInitial());

  void loginUser(String login, String passwd) {
    emit(ProcessingLogin());
    repository.loginUser(login, passwd).then((status) {
      switch (status) {
        case 200:
          emit(Logged());
          break;
        case 401:
          emit(InvalidResponse(
            title: "Wrong data",
            body: "Opps... Wrong login or password!",
          ));
          break;
        case 521:
          emit(InvalidResponse(
            title: "Web server is down",
            body: "Opps... No connection!",
          ));
          break;
        default:
          emit(InvalidResponse(
            title: "Error",
            body: "Opps... Something went wrong!",
          ));
          break;
      }
    });
  }
}
