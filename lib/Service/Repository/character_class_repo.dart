import 'package:burgerking_apitest/Service/DataModels/charktermode_class.dart';
import 'package:burgerking_apitest/Service/Services/character_services.dart';
import 'package:burgerking_apitest/Service/Utils/api_interceptor.dart';
import 'package:burgerking_apitest/Service/Utils/api_request_failure.dart';
import 'package:dartz/dartz.dart'; // Assuming you're using the dartz package for Either

abstract class CharacterModelRepo {
  Future<Either<ApiRequestFailure, CharacterModel>> createCharacter(CharacterModel character);
  Future<Either<ApiRequestFailure, List<CharacterModel>>> getAllCharacters();

  Future<Either<ApiRequestFailure, CharacterModel>> updateCharacter(int id, CharacterModel character);
}

class CharacterModelRepoImplementation implements CharacterModelRepo {
  final CharacterModelService _characterModelService; // Assuming there's a CharacterModelService similar to VacationBlockerService

  CharacterModelRepoImplementation(this._characterModelService);

  @override
  Future<Either<ApiRequestFailure, CharacterModel>> createCharacter(CharacterModel character) {
    return apiInterceptor(() => _characterModelService.createCharacter(character));
  }

  @override
  Future<Either<ApiRequestFailure, List<CharacterModel>>> getAllCharacters() {
    return apiInterceptor(() => _characterModelService.getAllCharacters());
  }



  @override
  Future<Either<ApiRequestFailure, CharacterModel>> updateCharacter(int id, CharacterModel character) {
    return apiInterceptor(() => _characterModelService.updateCharacter(id, character));
  }
  
 
}
