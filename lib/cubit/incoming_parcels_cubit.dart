// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_box/data/models/parcel_showcase.dart';

import 'package:post_box/data/repository.dart';

part 'incoming_parcels_state.dart';

class ParcelsCubit extends Cubit<ParcelsState> {
  final Repository repository;
  ParcelsCubit({
    required this.repository,
  }) : super(IncomingParcelsInitial());

  void fetchIncomingParcels() {
    repository.fetchIncomingParcels().then((parcels) {
      emit(IncomParcelsLoaded(parcelSchowcase: parcels));
    });
  }

  void fetchParcels() {
    repository.fetchIncomingParcels().then((incom) {
      repository.fetchSendingParcels().then((send) {
        emit(ParcelsLoaded(
            incomParcelSchowcase: incom, sendParcelSchowcase: send));
      });
    });
  }

  void fetchSendingParcels() {
    repository.fetchSendingParcels().then((parcels) {
      emit(SendParcelsLoaded(sendParcelSchowcase: parcels));
    });
  }
}
