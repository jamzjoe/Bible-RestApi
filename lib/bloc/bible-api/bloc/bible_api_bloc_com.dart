import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:laravel_practice/models/bible-api-model.dart';
import 'package:laravel_practice/models/bible-api-models.dart';
import 'package:laravel_practice/repository/bible-api.com.dart';
import 'package:laravel_practice/repository/bible-repository.dart';
import 'package:laravel_practice/screens/bible-api-com.dart';

part 'bible_api_event_com.dart';
part 'bible_api_state_com.dart';

final BibleApiComRepository bibleRepository = BibleApiComRepository();

class BibleApiComBloc extends Bloc<BibleApiComEvent, BibleApiComState> {
  BibleApiComBloc() : super(BibleApiComInitial()) {
    on<BibleApiComEvent>((event, emit) {});
    // on<FetchBibleApiCom>((event, emit) async {
    //   emit(BibleApiComLoading());
    //   try {
    //     BibleApiCom bibleApiModel = BibleApiCom();
    //     final bibles = await bibleRepository.getBibleByID(event., chapter, verse);
    //     emit(BibleApiComLoaded(bibles, bibleApiModel));
    //   } catch (e) {
    //     emit(BibleApiComLoadingError(e.toString()));
    //   }
    // });

    on<FetchBibleApiComID>((event, emit) async {
      emit(BibleApiComLoading());
      try {
        final bible = await bibleRepository.getBibleByID(book: event.book,
            chapter: event.chapter, verse: event.verse);
        emit(BibleApiComLoaded(bible));
      } catch (e) {
        emit(BibleApiComLoadingError(e.toString()));
        emit(BibleApiComInitial());
      }
    });

    on<Refresh>((event, emit)async {
      emit(BibleApiComLoading());
      emit(BibleApiComInitial());
    });
  }
}
