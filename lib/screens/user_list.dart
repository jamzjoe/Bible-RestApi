import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laravel_practice/bloc/users_bloc.dart';
import 'package:laravel_practice/models/user_models.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true,
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UserLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserLoaded) {
            return ListView(
              children: state.users.map(createTiles).toList(),
            );
          } else if (state is UserLoadedError) {
            return Center(
              child: Text(state.error),
            );
          }
          return const Center(
            child: Text('Something went wrong!'),
          );
        },
      ),
    );
  }

  Widget createTiles(Users e) => Card(
    child: ListTile(
          title: Text(e.name.toString()),
          subtitle: Text(e.email.toString()),
          trailing: Text(e.createdAt.toString(), overflow: TextOverflow.ellipsis,),
        ),
  );
}
