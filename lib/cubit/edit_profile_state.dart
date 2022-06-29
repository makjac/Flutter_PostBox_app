part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class UpdatingProfile extends EditProfileState {}

class Updated extends EditProfileState {}

class InvalidResponse extends EditProfileState {
  final String title;
  final String body;

  InvalidResponse({required this.title, required this.body});
}
