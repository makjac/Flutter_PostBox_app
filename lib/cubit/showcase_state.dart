part of 'showcase_cubit.dart';

@immutable
abstract class ShowcaseState {}

class ShowcaseInitial extends ShowcaseState {}

class ShowcaseLoaded extends ShowcaseState {
  final List<UserShowcase>? showcase;

  ShowcaseLoaded({this.showcase});
}
