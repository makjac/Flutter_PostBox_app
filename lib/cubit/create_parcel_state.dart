part of 'create_parcel_cubit.dart';

@immutable
abstract class CreateParcelState {}

class CreateParcelInitial extends CreateParcelState {}

class PostmachinesLoaded extends CreateParcelState {
  // final List<PostMachine>? incomParcelSchowcase;
  final List<PostMachine>? postmachines;

  PostmachinesLoaded({this.postmachines});
}

class CreatingParcel extends CreateParcelState {}

class Created extends CreateParcelState {}

class InvalidResponse extends CreateParcelState {
  final String title;
  final String body;

  InvalidResponse({required this.title, required this.body});
}
