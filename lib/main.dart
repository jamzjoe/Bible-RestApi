import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laravel_practice/bloc/bible-api/bloc/bible_api_bloc_com.dart';
import 'package:laravel_practice/bloc/bible_api_bloc.dart';
import 'package:laravel_practice/bloc/users_bloc.dart';
import 'package:laravel_practice/screens/bible-api-com.dart';
import 'package:laravel_practice/screens/bible-api.dart';
import 'package:laravel_practice/screens/home.dart';
import 'package:laravel_practice/screens/user_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsersBloc>(
          create: (context) => UsersBloc()..add(FetchUsers()),
        ),
        BlocProvider<BibleApiBloc>(
          create: (context) => BibleApiBloc(),
        ),
        BlocProvider<BibleApiComBloc>(create: (context) => BibleApiComBloc())
      ],
      child: MaterialApp(
        routes: {
          '/bible': (context) => const BibleApi(),
          '/user_list': (context) => const UserList(),
          '/bible-api.com': (context) => const BibleApiCom()
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}
