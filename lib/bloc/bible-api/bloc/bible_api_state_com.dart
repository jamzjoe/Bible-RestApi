part of 'bible_api_bloc_com.dart';

class BibleApiComState extends Equatable {
  const BibleApiComState();

  @override
  List<Object> get props => [];
}

class BibleApiComInitial extends BibleApiComState {}

class BibleApiComLoading extends BibleApiComState {}

class BibleApiComLoaded extends BibleApiComState {
  final BibleApiComModels bible;

  const BibleApiComLoaded(this.bible);
}

class BibleApiComLoadingError extends BibleApiComState {
  final String error;
  const BibleApiComLoadingError(this.error);
}
