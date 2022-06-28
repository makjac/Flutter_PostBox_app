part of 'sending_parcel_cubit.dart';

@immutable
abstract class SendingParcelState {}

class SendingParcelInitial extends SendingParcelState {}

class SendParcelsLoaded extends SendingParcelState {
  final List<ParcelShowcase>? parcelSchowcase;

  SendParcelsLoaded({this.parcelSchowcase});
}
