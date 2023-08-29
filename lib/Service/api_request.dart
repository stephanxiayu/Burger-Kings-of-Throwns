
import 'package:burgerking_apitest/CharakterModel/charktermode_class.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
 // Import your CharacterModel class

class ApiService {
  

  // Define the base URL
  final String baseUrl = "https://thronesapi.com"; // This is just an example. Replace it with the actual base URL if it's different.

  Future<List<CharacterModel>?> getCharacters() async {
    var client = http.Client();
    var uri = Uri.parse("$baseUrl/api/v2/Characters");

    var response = await client.get(uri);
    if (response.statusCode == 200|| response.statusCode == 201) {


      var jsonList = jsonDecode(response.body) as List;
      return jsonList.map((json) => CharacterModel.fromJson(json)).toList();
      
    
    } else {
      print("Failed to fetch characters with statusCode: ${response.statusCode}");
      return null;
    }
    
  }

}

