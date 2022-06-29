// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_box/data/models/parcel_history.dart';
import 'package:post_box/data/models/parcel_destination.dart';

import 'package:post_box/data/repository.dart';

part 'parcel_history_state.dart';

class ParcelHistoryCubit extends Cubit<ParcelHistoryState> {
  final Repository repository;
  ParcelHistoryCubit({
    required this.repository,
  }) : super(ParcelHistoryInitial());

  void fetchParcelHistory(String uuid) {
    repository.fetchParcelHistory(uuid).then((parcels) {});
  }

  void fetchParcels(String uuid) {
    repository.fetchParcelHistory(uuid).then((history) {
      repository.fetchParcelDestination(uuid).then((destination) {
        emit(ParcelsLoaded(
          parcelDestinationSchowcase: destination,
          parcelHistorySchowcase: history,
        ));
      });
    });
  }

  void fetchParcelDestination(String uuid) {
    repository.fetchParcelDestination(uuid).then((parcels) {});
  }
}
