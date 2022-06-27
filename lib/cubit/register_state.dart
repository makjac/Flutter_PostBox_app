part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class ProcessingRegister extends RegisterState {}

class Registered extends RegisterState {}

class InvalidResponse extends RegisterState {
  final String title;
  final String body;

  InvalidResponse({required this.title, required this.body});
}
