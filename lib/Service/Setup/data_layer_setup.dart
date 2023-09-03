import 'package:burgerking_apitest/Service/Repository/character_class_repo.dart';
import 'package:burgerking_apitest/Service/Services/character_services.dart';
import 'package:burgerking_apitest/Service/Usecases/create_character_case.dart';
import 'package:burgerking_apitest/Service/Usecases/get_character_case.dart';
import 'package:burgerking_apitest/Service/Usecases/update_character_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DataLayerSetup {
  static Future<void> initialize() async {
getIt.registerLazySingleton<CharacterModelRepo>(
    () => CharacterModelRepoImplementation(getIt<CharacterModelService>()));

    // Character related registrations
    getIt.registerLazySingleton<CharacterModelService>(
        () => CharacterModelServiceImplementation());

    getIt.registerLazySingleton(() => CreateCharacterCase(getIt()));
    getIt.registerLazySingleton(() => GetAllCharactersCase(getIt()));
    getIt.registerLazySingleton(() => UpdateCharacterCase(getIt()));

    //... continuation of the other registrations
  }
}