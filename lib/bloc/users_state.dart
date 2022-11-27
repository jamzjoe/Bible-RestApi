part of 'users_bloc.dart';

@immutable
class UsersState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UsersInitial extends UsersState {}

class UserLoading extends UsersState{}
class UserLoaded extends UsersState{
  final List<Users> users;

  UserLoaded(this.users);
}

class UserLoadedError extends UsersState{
  final String error;

  UserLoadedError(this.error);
}