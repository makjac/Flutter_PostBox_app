// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_box/data/models/register_model.dart';

import 'package:post_box/data/repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final Repository repository;
  RegisterCubit({
    required this.repository,
  }) : super(RegisterInitial());

  void RegisterUser(RegisterModel form) {
    emit(ProcessingRegister());
    repository.registerUser(form).then((status) {
      switch (status) {
        case 200:
          emit(Registered());
          break;
        case 401:
          emit(InvalidResponse(
            title: "Wrong data",
            body: "Opps... Wrong input data!",
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
