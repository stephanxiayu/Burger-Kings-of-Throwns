import 'dart:convert';

import 'package:burgerking_apitest/Components/Content.dart';
import 'package:burgerking_apitest/Screen/HomeScreen/HomeScreen.dart';
import 'package:burgerking_apitest/Service/DataModels/charktermode_class.dart';
import 'package:burgerking_apitest/Service/Usecases/get_character_case.dart';
import 'package:burgerking_apitest/Shared/globalContraoller.dart';
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

  Future<void> getAllCharacters() async {
    var response = await GetAllCharactersCase.it.call(null);
    response.fold((l) => l.error, (r) {
      // print("print test ${r}");
      characterData = r;
      notifyListeners();
    });
    notifyListeners();
  }

  Future<void> fetchData() async {
    await getAllCharacters(); // Make sure this function returns a Future if it's async
    data = characterData.cast<CharacterModel>();

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
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
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

  Future<List<CharacterModel>> _getFromPrefs(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(key) ?? [];
    return data
        .map((item) => CharacterModel.fromJson(jsonDecode(item)))
        .toList();
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
