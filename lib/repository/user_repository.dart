import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:laravel_practice/models/user_models.dart';
class UserRepository{
  final endpoint = 'http://192.168.224.13:8000/api/';


  Future<List<Users>>getUsers()async{
    http.Response response = await http.get(Uri.parse('${endpoint}users'));
    if(response.statusCode == 200){
      final List result = json.decode(response.body);
      return result.map((e) => Users.fromJson(e)).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }


}