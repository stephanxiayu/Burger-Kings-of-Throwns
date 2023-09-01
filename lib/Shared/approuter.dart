

import 'package:burgerking_apitest/Screen/Chats/ChatController.dart';
import 'package:burgerking_apitest/Screen/Chats/ChatScreens.dart';
import 'package:burgerking_apitest/Screen/HomeScreen/HomeScreen.dart';
import 'package:burgerking_apitest/Screen/HomeScreen/HomescreenController.dart';
import 'package:burgerking_apitest/Screen/NavigationErrorPage/NavigationErrorPage.dart';
import 'package:burgerking_apitest/Screen/Profiles/ProfilScreen.dart';
import 'package:burgerking_apitest/Screen/Profiles/profilController.dart';

import 'package:burgerking_apitest/Shared/globalContraoller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// das Route Sytsem of the app.
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.pageName:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<HomeScreenController>(
              create: (context) => HomeScreenController(
                  Provider.of<GlobalController>(context, listen: false)),
               
              child: const HomeScreen()),
        );
              case ChatScreen.pageName:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<ChatController>(
              create: (context) => ChatController(
                  Provider.of<GlobalController>(context, listen: false)),
               
              child:  ChatScreen()),
        );
              case ProfilScreen.pageName:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<ProfilController>(
              create: (context) => ProfilController(
                  Provider.of<GlobalController>(context, listen: false)),
               
              child: const ProfilScreen()),
        );
     
      default:
        return MaterialPageRoute(
            builder: (_) => NavigationErrorPage(
                  errorPageName: settings.name,
                ));
    }
  }
}
