import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laravel_practice/bloc/bible_api_bloc.dart';
import 'package:laravel_practice/bloc/users_bloc.dart';
import 'package:laravel_practice/models/bible-api-model.dart';
import 'package:laravel_practice/screens/single_book.dart';

class BibleApi extends StatefulWidget {
  const BibleApi({Key? key}) : super(key: key);

  @override
  State<BibleApi> createState() => _BibleApiState();
}


class _BibleApiState extends State<BibleApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bible Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  BlocProvider.of<BibleApiBloc>(context)
                      .add(FetchBibleApi('books'));
                },
                icon: const Icon(Icons.search),
                label: const Text('Look for a Books')),
            BlocBuilder<BibleApiBloc, BibleApiState>(builder: (context, state) {
              print(state);
              if (state is BibleApiLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is BibleApiLoaded) {
                print(state.bibles.toString());
                return Expanded(
                    child: ListView(
                  children: state.bibles.map(createTiles).toList(),
                ));
              } else if (state is BibleApiLoadingError) {

                print(state.error.toString());
                return Center(
                  child: Text(state.error),
                );
              }
              return const Center(
                child: Text('Bible Api'),
              );
            })
          ],
        ),
      ),
    );
  }

  Widget createTiles(BibleApiModel e) => Card(
        child: ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                SingleBook(api: 'books', id: e.id.toString())));
          },
          title: Text(e.name.toString()),
          subtitle: Text(e.testament.toString()),
          trailing: Text(e.genre!.name.toString()),
        ),
      );
}
