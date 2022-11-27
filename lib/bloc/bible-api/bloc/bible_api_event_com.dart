part of 'bible_api_bloc_com.dart';

class BibleApiComEvent extends Equatable {
  const BibleApiComEvent();

  @override
  List<Object> get props => [];
}

class FetchBibleApiCom extends BibleApiComEvent {
  final String api;
  const FetchBibleApiCom(this.api);
}

class FetchBibleApiComID extends BibleApiComEvent {
  final String book, chapter, verse;

  const FetchBibleApiComID(this.book, this.chapter, this.verse);
}

class Refresh extends BibleApiComEvent{

}