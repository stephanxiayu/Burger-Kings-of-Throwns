import 'dart:convert';


import 'package:burgerking_apitest/Components/content.dart';
import 'package:burgerking_apitest/Screen/HomeScreen/home_screem.dart';
import 'package:burgerking_apitest/Shared/global_contraoller.dart';
import 'package:burgerking_apitest/core/controller/character_controller.dart';
import 'package:burgerking_apitest/core/model/character_models.dart';
import 'package:burgerking_apitest/locator.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomeScreenController extends ChangeNotifier {
  GlobalController? globalController;
  List<CharacterModel> characterData;

  List<CharacterModel> likedItems = [];
  List<CharacterModel> superLikedItems = [];

  List<CharacterModel>? data;
  String? actionMessage;

  List<SwipeItem> swipeItems = <SwipeItem>[];
  MatchEngine? matchEngine;
  HomeScreenController({this.globalController, this.characterData = const []});

  Future<List<CharacterModel>> getAllCharacters() async {
    List<CharacterModel> characters =
        await getIt.get<ChracterController>().getNextCharacter();

    return characters;
  }

  Future<void> fetchData() async {
    data = await getAllCharacters();

    for (int i = 0; i < data!.length; i++) {
      swipeItems.add(SwipeItem(
          content:
              Content(text: data![i].fullName, imageUrl: data![i].imageUrl),
          likeAction: () {
            actionMessage = "LIKE";
            likedItems.add(data![i]);
            _saveToPrefs('likedItems', likedItems);

            Future.delayed(const Duration(milliseconds: 500), () {
              actionMessage = null;
              notifyListeners();
            });
            notifyListeners();
          },
          nopeAction: () {
            actionMessage = "NOPE";

            Future.delayed(const Duration(milliseconds: 500), () {
              actionMessage = null;
              notifyListeners();
            });
            notifyListeners();
          },
          superlikeAction: () async {
            actionMessage = "SUPERLIKE";
            superLikedItems.add(data![i]);
            await _saveToPrefs('superLikedItems', superLikedItems);
            Future.delayed(const Duration(milliseconds: 500), () {
              actionMessage = null;
              notifyListeners();
            });
            notifyListeners();
          },
          onSlideUpdate: (SlideRegion? region) async {}));
      notifyListeners();
    }

    matchEngine = MatchEngine(swipeItems: swipeItems);
    notifyListeners();
  }

  Future<void> _saveToPrefs(String key, List<CharacterModel> items) async {
    final prefs = await SharedPreferences.getInstance();
    final data = items.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList(key, data);
    notifyListeners();
  }



  void likeAction(CharacterModel character) async {
    if (!listContainsCharacter(likedItems, character)) {
      likedItems.add(character);
      notifyListeners();
      await _saveToPrefs('likedItems', likedItems);
    }
    notifyListeners();
  }

  void superlikeAction(CharacterModel character) async {
    if (!listContainsCharacter(superLikedItems, character)) {
      superLikedItems.add(character);
      notifyListeners();
      await _saveToPrefs('superLikedItems', superLikedItems);
    }
    notifyListeners();
  }


  
}
