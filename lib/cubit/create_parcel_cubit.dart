// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_box/data/models/postmachine_model.dart';

import 'package:post_box/data/repository.dart';

part 'create_parcel_state.dart';

class CreateParcelCubit extends Cubit<CreateParcelState> {
  final Repository repository;
  CreateParcelCubit({
    required this.repository,
  }) : super(CreateParcelInitial());

  void fetchPstmachines() {
    repository.fetchPstmachines().then((pm) {
      emit(PostmachinesLoaded(postmachines: pm));
    });
  }

  void createParcel(String login, String parcelName, int rid, int sid) {
    emit(CreatingParcel());
    repository.createParcel(login, parcelName, rid, sid).then((status) {
      switch (status) {
        case 200:
          emit(Created());
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
