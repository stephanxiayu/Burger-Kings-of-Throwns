import 'package:burgerking_apitest/Service/DataModels/charktermode_class.dart';
import 'package:burgerking_apitest/Service/Repository/character_class_repo.dart';
import 'package:burgerking_apitest/Service/Setup/data_layer_setup.dart';
import 'package:burgerking_apitest/Service/Usecases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../Utils/api_request_failure.dart';
class GetAllCharactersCase
    with UseCases<Either<ApiRequestFailure, List<CharacterModel>>, void> {
  final CharacterModelRepo _characterModelRepo;  // Changed to CharacterModelRepo

  GetAllCharactersCase(this._characterModelRepo);

@override
Future<Either<ApiRequestFailure, List<CharacterModel>>> call(void _) {  
    return _characterModelRepo.getAllCharacters();
}

  static GetAllCharactersCase get it => getIt<GetAllCharactersCase>();
}
