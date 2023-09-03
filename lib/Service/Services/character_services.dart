import 'package:burgerking_apitest/Service/DataModels/charktermode_class.dart';
import 'package:burgerking_apitest/Service/Utils/base_api.dart';

abstract class CharacterModelService {
  Future<CharacterModel> createCharacter(CharacterModel character);
  Future<List<CharacterModel>> getAllCharacters();
  Future<CharacterModel> updateCharacter(int id, CharacterModel character);
}

class CharacterModelServiceImplementation extends BaseApi implements CharacterModelService {

  @override
  Future<CharacterModel> createCharacter(CharacterModel character) async {
    final response = await dio.post('/api/v2/Characters', data: character.toJson());

    if (response.statusCode == 200 || response.statusCode == 201) {
      return CharacterModel.fromJson(response.data);
    }
    throw Exception("Failed to create character");
  }

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    final response = await dio.get('/api/v2/Characters');
    
    if (response.statusCode == 200 || response.statusCode == 201) {
      return (response.data as List).map((character) => CharacterModel.fromJson(character)).toList();
    }
    throw Exception("Failed to get characters");
  }

  @override
  Future<CharacterModel> updateCharacter(int id, CharacterModel character) async {
    final response = await dio.patch('/api/v2/Characters/$id', data: character.toJson());

    if (response.statusCode == 200 || response.statusCode == 201) {
      return CharacterModel.fromJson(response.data);
    }
    throw Exception("Failed to update character");
  }
}
