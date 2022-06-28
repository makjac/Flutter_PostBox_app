// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'incoming_parcels_cubit.dart';

@immutable
abstract class IncomingParcelsState {}

class IncomingParcelsInitial extends IncomingParcelsState {}

class IncomParcelsLoaded extends IncomingParcelsState {
  final List<ParcelShowcase>? parcelSchowcase;

  IncomParcelsLoaded({this.parcelSchowcase});
}

class SendParcelsLoaded extends IncomingParcelsState {
  final List<ParcelShowcase>? sendParcelSchowcase;

  SendParcelsLoaded({this.sendParcelSchowcase});
}

class ParcelsLoaded extends IncomingParcelsState {
  final List<ParcelShowcase>? incomParcelSchowcase;
  final List<ParcelShowcase>? sendParcelSchowcase;
  ParcelsLoaded({
    this.incomParcelSchowcase,
    this.sendParcelSchowcase,
  });
}
