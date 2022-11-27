import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laravel_practice/bloc/bible-api/bloc/bible_api_bloc_com.dart';

class BibleApiCom extends StatefulWidget {
  const BibleApiCom({Key? key}) : super(key: key);

  @override
  State<BibleApiCom> createState() => _BibleApiComState();
}

final TextEditingController _bibleController = TextEditingController();
final TextEditingController _chapterController = TextEditingController();

class _BibleApiComState extends State<BibleApiCom> {
  @override
  void initState() {
    super.initState();
  }

  bool isAccept = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black87, BlendMode.srcOver),
              image: AssetImage('assets/bg.jpg'),
              fit: BoxFit.cover)),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 3.0),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<BibleApiComBloc>(context).add(Refresh());
                    setState(() {
                      _chapterController.text = '';
                      _bibleController.text = '';
                    });
                  },
                  icon: const Icon(Icons.refresh)),
            ],
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: BlocConsumer<BibleApiComBloc, BibleApiComState>(
            listener: (context, state) {
              if (state is BibleApiComLoadingError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              if (state is BibleApiComInitial) {
                return InputField(context);
              }
              if (state is BibleApiComLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is BibleApiComLoaded) {
                final data = state.bible;
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            InputField(context),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.black26,
                                child: ListTile(
                                  tileColor: Colors.transparent,
                                  title: Text(
                                    data.reference.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    data.text.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Center InputField(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Free Bible Api by Tim Morgan',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Developed with Flutter by Joe Cristian Jamis',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value!.length == 3) {
                    return 'Input not valid';
                  } else {
                    return null;
                  }
                },
                controller: _bibleController,
                decoration: const InputDecoration(
                    fillColor: Colors.black87,
                    filled: true,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                    label: Text(
                      'Book Name',
                      style: TextStyle(color: Colors.white),
                    ),
                    hintText: 'Psalm'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (!value!.contains(':')) {
                    return 'Please add verse after ":"';
                  } else if (value.length == 2) {
                    return 'Input not valid.';
                  } else {
                    return null;
                  }
                },
                controller: _chapterController,
                decoration: const InputDecoration(
                    fillColor: Colors.black87,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                    label: Text(
                      'Chapter Verse',
                      style: TextStyle(color: Colors.white),
                    ),
                    hintText: 'Book'),
              ),
              ElevatedButton.icon(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black26),
                  autofocus: true,
                  onPressed: () {
                    final book = _bibleController.text.toString().trim();
                    final chapter =
                        _chapterController.text.trim().split(':')[0];
                    final verse = _chapterController.text.trim().split(':')[1];
                    BlocProvider.of<BibleApiComBloc>(context)
                        .add(FetchBibleApiComID(book, chapter, verse));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Find Bible Chapter Verse',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
