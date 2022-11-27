import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:laravel_practice/models/bible-api-model.dart';
import 'package:laravel_practice/repository/bible-repository.dart';

part 'bible_api_event.dart';
part 'bible_api_state.dart';

final BibleRepository bibleRepository = BibleRepository();

class BibleApiBloc extends Bloc<BibleApiEvent, BibleApiState> {
  BibleApiBloc() : super(BibleApiInitial()) {
    on<BibleApiEvent>((event, emit) {});
    on<FetchBibleApi>((event, emit) async {
      emit(BibleApiLoading());
      try {
        BibleApiModel bibleApiModel = BibleApiModel();
        final bibles = await bibleRepository.getBible(event.api);
        emit(BibleApiLoaded(bibles, bibleApiModel));
      } catch (e) {
        emit(BibleApiLoadingError(e.toString()));
      }
    });

    on<FetchBibleByID>((event, emit) async {
      emit(BibleApiLoading());
      try {
        final bibles = await bibleRepository.getBibleByID(event.id, event.api);
        emit(BibleApiLoaded([], bibles));
      } catch (e) {
        emit(BibleApiLoadingError(e.toString()));
      }
    });
  }
}
