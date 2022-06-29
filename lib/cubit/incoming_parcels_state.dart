// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'incoming_parcels_cubit.dart';

@immutable
abstract class ParcelsState {}

class IncomingParcelsInitial extends ParcelsState {}

class IncomParcelsLoaded extends ParcelsState {
  final List<ParcelShowcase>? parcelSchowcase;

  IncomParcelsLoaded({this.parcelSchowcase});
}

class SendParcelsLoaded extends ParcelsState {
  final List<ParcelShowcase>? sendParcelSchowcase;

  SendParcelsLoaded({this.sendParcelSchowcase});
}

class ParcelsLoaded extends ParcelsState {
  final List<ParcelShowcase>? incomParcelSchowcase;
  final List<ParcelShowcase>? sendParcelSchowcase;
  ParcelsLoaded({
    this.incomParcelSchowcase,
    this.sendParcelSchowcase,
  });
}
