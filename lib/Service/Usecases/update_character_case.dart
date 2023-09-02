import 'package:burgerking_apitest/Service/Repository/character_class_repo.dart';
import 'package:burgerking_apitest/Service/Setup/data_layer_setup.dart';
import 'package:burgerking_apitest/Service/Usecases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../DataModels/charktermode_class.dart';
import '../Utils/api_request_failure.dart';

class UpdateCharacterCase
    with UseCases<Either<ApiRequestFailure, CharacterModel>, CharacterModel> {
  final CharacterModelRepo _characterModelRepo;  // Changed to CharacterModelRepo

  UpdateCharacterCase(this._characterModelRepo);

  @override
  Future<Either<ApiRequestFailure, CharacterModel>> call(CharacterModel character) {
    // You'll likely need the character's ID to update it, so ensure that the ID is available in the model.
    return _characterModelRepo.updateCharacter(character.id, character);
  }

  static UpdateCharacterCase get it => getIt<UpdateCharacterCase>();
}

