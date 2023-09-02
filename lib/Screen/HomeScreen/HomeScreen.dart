import 'dart:convert';

import 'package:burgerking_apitest/CharakterModel/charktermode_class.dart';
import 'package:burgerking_apitest/Components/AppScaffold.dart';
import 'package:burgerking_apitest/Components/avatar_detail.dart';
import 'package:burgerking_apitest/Screen/DetailScreen/DetailScreen.dart';

import 'package:burgerking_apitest/Screen/DetialScreen/DetailScreen.dart';

import 'package:burgerking_apitest/Service/api_request.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';


import '../../Components/Content.dart';

bool listContainsCharacter(
    List<CharacterModel> list, CharacterModel character) {
  return list.any((item) => item.id == character.id);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String pageName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CharacterModel> likedItems = [];
  List<CharacterModel> superLikedItems = [];

  List<CharacterModel>? data;
  String? actionMessage;

  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Future<void> _saveToPrefs(String key, List<CharacterModel> items) async {
    final prefs = await SharedPreferences.getInstance();
    final data = items.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList(key, data);
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
      setState(() {
        likedItems.add(character);
      });
      await _saveToPrefs('likedItems', likedItems);
    }
  }

  void superlikeAction(CharacterModel character) async {
    if (!listContainsCharacter(superLikedItems, character)) {
      setState(() {
        superLikedItems.add(character);
      });
      await _saveToPrefs('superLikedItems', superLikedItems);
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    var characters = await ApiService().getCharacters();
    setState(() {
      data = characters;

      for (int i = 0; i < data!.length; i++) {
        _swipeItems.add(SwipeItem(
            content:
                Content(text: data![i].fullName, imageUrl: data![i].imageUrl),
            likeAction: () {
              setState(() async {
                actionMessage = "LIKE";
                likedItems.add(data![i]);
                await _saveToPrefs('likedItems', likedItems);
              });
              Future.delayed(const Duration(milliseconds: 500), () {
                setState(() {
                  actionMessage = null;
                });
              });
            },
            nopeAction: () {
              setState(() async {
                actionMessage = "NOPE";
              });
              Future.delayed(const Duration(milliseconds: 500), () {
                setState(() {
                  actionMessage = null;
                });
              });
            },
            superlikeAction: () async {
              setState(() async {
                actionMessage = "SUPERLIKE";
                superLikedItems.add(data![i]);
                await _saveToPrefs('superLikedItems', superLikedItems);
                Future.delayed(const Duration(milliseconds: 500), () {
                  setState(() {
                    actionMessage = null;
                  });
                });
              });
            },
            onSlideUpdate: (SlideRegion? region) async {
              print("Region $region");
            }));
      }

      _matchEngine = MatchEngine(swipeItems: _swipeItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    if (data == null) {
      return AppScaffold(
        appBar: AppBar(title: const Text("Loading...")),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return AppScaffold(
      key: _scaffoldKey,
      child: Container(
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: SwipeCards(
              matchEngine: _matchEngine!,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        // Image
                        Image.network(
                          _swipeItems[index].content.imageUrl,
                          height: screenHeight *
                              3 /
                              3, // This makes it full screen height, adjust accordingly
                          fit: BoxFit.cover,
                        ),

                        // Gradient overlay at the bottom 1/5 of the image
                        Positioned.fill(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [
                                  0.8,
                                  1.0
                                ], // this will make gradient start at 80% from top and end at the bottom
                              ),
                            ),
                          ),
                        ),

                        // Text and button
                        Positioned(
                          bottom: 100.0,
                          left: 10.0,
                          right: 10.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _swipeItems[index].content.text,
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 3.0,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ]),
                              ),
                           IconButton(
    icon: const Icon(
      Icons.info,
      color: Colors.white,
      size: 30,
    ),
    onPressed: () {
     Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => DetailScreen(
          description: data![index].description,  // assuming your SwipeItem has a description field
          id: data![index].id,
          firstName: data![index].firstName,
          lastName: data![index].lastName,
          fullName: data![index].fullName,
          title: data![index].title,
          family: data![index].family,
      
          imageUrl: data![index].imageUrl,
        )
      ));
    },
)


                            ],
                          ),
                        ),
                        Positioned(
                          top: 50.0,
                          left: 0,
                          right: 0,
                          child: actionMessage == null
                              ? Container() // Empty container if no action
                              : Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24.0, vertical: 8.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: actionMessage == "LIKE"
                                              ? Colors.green
                                              : actionMessage == "NOPE"
                                                  ? Colors.red
                                                  : Colors.blue),
                                      color: actionMessage == "LIKE"
                                          ? Colors.transparent
                                          : actionMessage == "NOPE"
                                              ? Colors.transparent
                                              : Colors
                                                  .transparent, // default to blue for SUPERLIKE
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Text(
                                      actionMessage!,
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        color: actionMessage == "LIKE"
                                            ? Colors.green
                                            : actionMessage == "NOPE"
                                                ? Colors.red
                                                : Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ));
              },
              onStackFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Stack Finished"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              itemChanged: (SwipeItem item, int index) {
                print("item: ${item.content.text}, index: $index");
              },
              leftSwipeAllowed: true,
              rightSwipeAllowed: true,
              upSwipeAllowed: true,
              fillSpace: true,
              // ... (rest of your SwipeCards properties)
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.red[300],
                    child: IconButton(
                      onPressed: () {
                        _matchEngine!.currentItem?.nope();
                      },
                      icon: const Icon(Icons.close,
                          color: Colors.white, size: 30.0),
                      tooltip: 'Nope',
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue[300],
                    child: IconButton(
                      onPressed: () {
                        _matchEngine!.currentItem?.superLike();
                      },
                      icon: const Icon(Icons.star,
                          color: Colors.white, size: 30.0),
                      tooltip: 'Superlike',
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green[300],
                    child: IconButton(
                      onPressed: () {
                        _matchEngine!.currentItem?.like();
                      },
                      icon: const Icon(Icons.favorite,
                          color: Colors.white, size: 30.0),
                      tooltip: 'Like',
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}



