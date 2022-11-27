part of 'bible_api_bloc.dart';

class BibleApiState extends Equatable {
  const BibleApiState();

  @override
  List<Object> get props => [];
}

class BibleApiInitial extends BibleApiState {}

class BibleApiLoading extends BibleApiState {}

class BibleApiLoaded extends BibleApiState {
  final List<BibleApiModel> bibles;
  final BibleApiModel bible;

  const BibleApiLoaded(this.bibles, this.bible);
}

class BibleApiLoadingError extends BibleApiState {
  final String error;
  const BibleApiLoadingError(this.error);
}
