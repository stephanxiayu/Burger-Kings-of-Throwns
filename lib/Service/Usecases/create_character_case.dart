import 'package:burgerking_apitest/Service/DataModels/charktermode_class.dart';
import 'package:burgerking_apitest/Service/Repository/character_class_repo.dart';
import 'package:burgerking_apitest/Service/Setup/data_layer_setup.dart';
import 'package:burgerking_apitest/Service/Usecases/use_case.dart';
import 'package:burgerking_apitest/Service/Utils/api_request_failure.dart';
import 'package:dartz/dartz.dart';

class CreateCharacterCase with UseCases<Either<ApiRequestFailure, CharacterModel>, CharacterModel> {
  final CharacterModelRepo _characterModelRepo; // Updated to CharacterModelRepo

  CreateCharacterCase(this._characterModelRepo);

  @override
  Future<Either<ApiRequestFailure, CharacterModel>> call(CharacterModel params) {
    return _characterModelRepo.createCharacter(params);
  }

  static CreateCharacterCase get it => getIt<CreateCharacterCase>();
}
