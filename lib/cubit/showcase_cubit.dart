import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_box/data/models/userShowcase.dart';
import 'package:post_box/data/repository.dart';

part 'showcase_state.dart';

class ShowcaseCubit extends Cubit<ShowcaseState> {
  final Repository repository;
  ShowcaseCubit({required this.repository}) : super(ShowcaseInitial());

  void fetchShowcase() {
    repository.fetchShowcase().then((showcase) {
      emit(ShowcaseLoaded(showcase: showcase));
    });
  }
}
