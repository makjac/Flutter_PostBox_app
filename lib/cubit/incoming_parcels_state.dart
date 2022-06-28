part of 'incoming_parcels_cubit.dart';

@immutable
abstract class IncomingParcelsState {}

class IncomingParcelsInitial extends IncomingParcelsState {}

class IncomParcelsLoaded extends IncomingParcelsState {
  final List<ParcelShowcase>? parcelSchowcase;

  IncomParcelsLoaded({this.parcelSchowcase});
}

class IncomParcelsNull extends IncomingParcelsState {}
