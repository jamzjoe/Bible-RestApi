import 'dart:convert';

import 'package:laravel_practice/models/bible-api-model.dart';
import 'package:http/http.dart' as http;

class BibleRepository {
  final endpoint = 'https://bible-go-api.rkeplin.com/v1';
  List<BibleApiModel> bibles = [];
  Future<List<BibleApiModel>>getBible(String api)async{
    http.Response response = await http.get(Uri.parse('${endpoint}/$api'));
    if(response.statusCode == 200){
      final List result = json.decode(response.body);
      return result.map((e) => BibleApiModel.fromJson(e)).toList();

    }else{
      throw Exception(response.reasonPhrase);
    }
  }

  Future<BibleApiModel> getBibleByID(String id, String api)async{
    http.Response response = await http.get(Uri.parse('${endpoint}/$api/$id'));
    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      BibleApiModel user = BibleApiModel.fromJson(result);
      return user;
    }else{
      throw Exception(response.reasonPhrase);
    }
  }

}
