import 'package:flutter/material.dart';
import 'package:laravel_practice/models/bible-api-models.dart';

class BibleDisplay extends StatefulWidget {
  const BibleDisplay({Key? key, required this.data}) : super(key: key);
  final BibleApiComModels data;
  @override
  State<BibleDisplay> createState() => _BibleDisplayState();
}

class _BibleDisplayState extends State<BibleDisplay> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView(
      children: [
        Container(
          child: Row(
            children: [
              Text(widget.data.reference.toString())
            ],
          ),
        )
      ],
    ));
  }
}
