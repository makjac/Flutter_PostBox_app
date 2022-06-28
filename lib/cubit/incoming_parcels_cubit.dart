// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_box/data/models/parcel_showcase.dart';

import 'package:post_box/data/repository.dart';

part 'incoming_parcels_state.dart';

class IncomingParcelsCubit extends Cubit<IncomingParcelsState> {
  final Repository repository;
  IncomingParcelsCubit({
    required this.repository,
  }) : super(IncomingParcelsInitial());

  void fetchIncomingParcels() {
    repository.fetchIncomingParcels().then((parcels) {
      emit(IncomParcelsLoaded(parcelSchowcase: parcels));
    });
  }
}
