// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:post_box/data/repository.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final Repository repository;
  EditProfileCubit({
    required this.repository,
  }) : super(EditProfileInitial());

  void updatePrifile(usrID, name, surname, phone, email) {
    emit(UpdatingProfile());

    repository.updatePrifile(usrID, name, surname, phone, email).then((status) {
      switch (status) {
        case 200:
          emit(Updated());
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
