// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_box/data/models/parcel_showcase.dart';

import 'package:post_box/data/repository.dart';

part 'sending_parcel_state.dart';

class SendingParcelCubit extends Cubit<SendingParcelState> {
  final Repository repository;
  SendingParcelCubit({
    required this.repository,
  }) : super(SendingParcelInitial());
}
