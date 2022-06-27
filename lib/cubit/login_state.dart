// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class ProcessingLogin extends LoginState {}

class Logged extends LoginState {}

class InvalidResponse extends LoginState {
  final String title;
  final String body;

  InvalidResponse({required this.title, required this.body});
}
