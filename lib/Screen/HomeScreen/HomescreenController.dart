


import 'package:burgerking_apitest/Service/Usecases/get_character_case.dart';
import 'package:burgerking_apitest/Shared/globalContraoller.dart';
import 'package:flutter/material.dart';

class HomeScreenController extends ChangeNotifier {
  GlobalController? globalController;
  List<Characters> characterData;

  HomeScreenController({this.globalController, this.characterData = const []});


  Future<void> getAllCharacters()async{
  var response=await GetAllCharactersCase.it.call(null);
  response.fold((l) => l.error, (r) {
    print("print test ${r}");
   characterData = r as List<Characters>;
    notifyListeners();


  });
 notifyListeners();
}
}
