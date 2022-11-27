import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:laravel_practice/models/user_models.dart';
import 'package:laravel_practice/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';

final UserRepository _users = UserRepository();

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<UsersEvent>((event, emit) {});
    on<FetchUsers>((event, emit) async {
      emit(UserLoading());

      try {
        final user = await _users.getUsers();
        emit(UserLoaded(user));
      } catch (e) {
        emit(UserLoadedError(e.toString()));
      }
    });
  }
}
