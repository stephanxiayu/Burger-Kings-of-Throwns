import 'package:burgerking_apitest/Components/shimmer.dart';
import 'package:burgerking_apitest/Screen/HomeScreen/HomescreenController.dart';
import 'package:burgerking_apitest/Service/DataModels/charktermode_class.dart';
import 'package:burgerking_apitest/Components/AppScaffold.dart';

import 'package:burgerking_apitest/Screen/DetailScreen/DetailScreen.dart';

import 'package:flutter/material.dart';

import 'package:swipe_cards/swipe_cards.dart';

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
  HomeScreenController homeScreenController = HomeScreenController();
  String? actionMessage;
  List<SwipeItem> swipeItems = <SwipeItem>[];
  MatchEngine? matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    homeScreenController.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = HomeScreenController();
    double screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: homeScreenController.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ShimmerLoading(); // Or any other loading widget
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          return AppScaffold(
            key: _scaffoldKey,
            child: Stack(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - kToolbarHeight,
                child: SwipeCards(
                  matchEngine: homeScreenController.matchEngine!,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            // Image
                            Image.network(
                              homeScreenController
                                  .swipeItems[index].content.imageUrl,
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
                                      Colors.black.withOpacity(0.8)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: const [
                                      0.1,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    homeScreenController
                                        .swipeItems[index].content.text,
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
                                              builder: (context) =>
                                                  DetailScreen(
                                                    description:
                                                        homeScreenController
                                                            .data![index]
                                                            .description, // assuming your SwipeItem has a description field
                                                    id: homeScreenController
                                                        .data![index].id,
                                                    firstName:
                                                        homeScreenController
                                                            .data![index]
                                                            .firstName,
                                                    lastName:
                                                        homeScreenController
                                                            .data![index]
                                                            .lastName,
                                                    fullName:
                                                        homeScreenController
                                                            .data![index]
                                                            .fullName,
                                                    title: homeScreenController
                                                        .data![index].title,
                                                    family: homeScreenController
                                                        .data![index].family,

                                                    imageUrl:
                                                        homeScreenController
                                                            .data![index]
                                                            .imageUrl,
                                                  )));
                                    },
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              top: 50.0,
                              left: 0,
                              right: 0,
                              child:   homeScreenController.   actionMessage == null
                                  ? Container() // Empty container if no action
                                  : Center(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24.0, vertical: 8.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: homeScreenController
                                                          .actionMessage ==
                                                      "LIKE"
                                                  ? Colors.green
                                                  : homeScreenController
                                                              .actionMessage ==
                                                          "NOPE"
                                                      ? Colors.red
                                                      : Colors.blue),
                                          color: homeScreenController
                                                      .actionMessage ==
                                                  "LIKE"
                                              ? Colors.transparent
                                              : homeScreenController
                                                          .actionMessage ==
                                                      "NOPE"
                                                  ? Colors.transparent
                                                  : Colors
                                                      .transparent, // default to blue for SUPERLIKE
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Text(
                                          homeScreenController.     actionMessage!,
                                          style: TextStyle(
                                            fontSize: 24.0,
                                            color: homeScreenController
                                                        .actionMessage ==
                                                    "LIKE"
                                                ? Colors.green
                                                : homeScreenController
                                                            .actionMessage ==
                                                        "NOPE"
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
                      content: Text("Game OVER! Du möchtest mehr Royales Erlebnis, dann geh zu Burger Kind in deiner Nähne", style: TextStyle(fontSize: 20),),
                      duration: Duration(seconds: 20),
                    ));
                  },
                  itemChanged: (SwipeItem item, int index) {},
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
                            homeScreenController.matchEngine!.currentItem
                                ?.nope();
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
                            homeScreenController.matchEngine!.currentItem
                                ?.superLike();
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
                            homeScreenController.matchEngine!.currentItem
                                ?.like();
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
          );
        });
  }
}
