

import 'dart:convert';


import 'package:burgerking_apitest/core/model/character_models.dart';

import 'package:http/http.dart' as http;
class Characterrepo {
  Future<List<CharacterModel>> getChracter() async {
    http.Response response = await http.get(Uri.parse("https://thronesapi.com/api/v2/Characters"));
    
    if (response.statusCode == 200) { // OK
      List<dynamic> charactersJson = jsonDecode(response.body);
      return charactersJson.map((character) => CharacterModel.fromJson(character)).toList();
    } else if (response.statusCode == 404) { // Not Found
      throw Exception('${response.statusCode} Not found');
    } else {
      throw Exception('Failed to load characters with status code: ${response.statusCode}');
    }
  }
}