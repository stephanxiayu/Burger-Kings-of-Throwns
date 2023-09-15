


import 'package:burgerking_apitest/Screen/Chats/chat_controller.dart';
import 'package:burgerking_apitest/Screen/Chats/chat_screen.dart';
import 'package:burgerking_apitest/Screen/HomeScreen/home_screem.dart';
import 'package:burgerking_apitest/Screen/HomeScreen/home_screen_controller.dart';
import 'package:burgerking_apitest/Screen/NavigationErrorPage/navigation_error_page.dart';
import 'package:burgerking_apitest/Screen/Profiles/profil_screen.dart';
import 'package:burgerking_apitest/Screen/Profiles/profil_controller.dart';

import 'package:burgerking_apitest/Shared/global_contraoller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.pageName:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<HomeScreenController>(
            create: (context) => HomeScreenController(
              globalController: Provider.of<GlobalController>(context, listen: false),
              // you can set characterData here or keep the default empty list
            ),
            child: const HomeScreen(),
          ),
        );

      case ChatScreen.pageName:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<ChatController>(
            create: (context) => ChatController(
              Provider.of<GlobalController>(context, listen: false),
            ),
            child: const ChatScreen(),
          ),
        );

      case ProfilScreen.pageName:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<ProfilController>(
            create: (context) => ProfilController(
              Provider.of<GlobalController>(context, listen: false),
            ),
            child: const ProfilScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => NavigationErrorPage(
            errorPageName: settings.name,
          ),
        );
    }
  }
}
