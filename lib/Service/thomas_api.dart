import 'dart:convert';
import 'package:burgerking_apitest/CharakterModel/thomas_character_class.dart';
import 'package:http/http.dart' as http;

class ThomasApiService {
  // Define the base URL
  final String baseUrl = "https://anapioficeandfire.com";

  Future<ThomasCharacter?> getCharacterById(int id) async {
    var client = http.Client();
    var uri = Uri.parse("$baseUrl/api/characters/$id");

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return ThomasCharacter.fromJson(json.decode(response.body));
    } else {
      print("Failed to fetch character with statusCode: ${response.statusCode}");
      return null;
    }
  }
}
