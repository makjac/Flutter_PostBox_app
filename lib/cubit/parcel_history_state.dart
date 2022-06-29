part of 'parcel_history_cubit.dart';

@immutable
abstract class ParcelHistoryState {}

class ParcelHistoryInitial extends ParcelHistoryState {}

class ParcelsLoaded extends ParcelHistoryState {
  final List<ParcelHistory>? parcelHistorySchowcase;
  final List<ParcelDestination>? parcelDestinationSchowcase;
  ParcelsLoaded({
    this.parcelHistorySchowcase,
    this.parcelDestinationSchowcase,
  });
}
