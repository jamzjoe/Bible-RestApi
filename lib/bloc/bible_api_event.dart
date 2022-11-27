part of 'bible_api_bloc.dart';

class BibleApiEvent extends Equatable {
  const BibleApiEvent();

  @override
  List<Object> get props => [];
}

class FetchBibleApi extends BibleApiEvent {
  final String api;
  const FetchBibleApi(this.api);
}

class FetchBibleByID extends BibleApiEvent{
  final String api;
  final String id;

  const FetchBibleByID(this.api, this.id);
}
