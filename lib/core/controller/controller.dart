import 'package:burgerking_apitest/core/model/character_models.dart';
import 'package:burgerking_apitest/core/repository/chracter_repo.dart';
import 'package:burgerking_apitest/locator.dart';

class ChracterController {
  Future<List<CharacterModel>> getNextCharacter() async {
    return await getIt.get<Characterrepo>().getChracter();
  }
}