

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laravel_practice/bloc/bible_api_bloc.dart';

class SingleBook extends StatefulWidget {
  const SingleBook({Key? key, required this.api, required this.id})
      : super(key: key);
  final String api;
  final String id;
  @override
  State<SingleBook> createState() => _SingleBookState();
}

class _SingleBookState extends State<SingleBook> {
  @override
  void initState() {
    BlocProvider.of<BibleApiBloc>(context)
        .add(FetchBibleByID(widget.api, widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<BibleApiBloc, BibleApiState>(
        listener: (context, state) {
          if (state is BibleApiLoadingError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is BibleApiLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BibleApiLoaded) {
            final data = state.bible;
            return Center(
              child: ListTile(
                title: Text(data.name.toString()),
                subtitle: Text(data.testament.toString()),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
