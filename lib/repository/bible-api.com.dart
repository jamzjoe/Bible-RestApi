import 'dart:convert';

import 'package:laravel_practice/models/bible-api-models.dart';
import 'package:http/http.dart' as http;
class BibleApiComRepository{
  final endpoint = 'https://bible-api.com/';
  Future<BibleApiComModels> getBibleByID({required String book, required String
  chapter, required String verse})
  async{
    http.Response response = await http.get(Uri.parse
      ('${endpoint}/$book$chapter:$verse'));
    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      BibleApiComModels bible = BibleApiComModels.fromJson(result);
      return bible;
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}