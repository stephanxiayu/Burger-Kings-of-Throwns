

import 'package:burgerking_apitest/Screen/HomeScreen/HomeScreen.dart';
import 'package:burgerking_apitest/Screen/HomeScreen/HomescreenController.dart';
import 'package:burgerking_apitest/Screen/NavigationErrorPage/NavigationErrorPage.dart';
import 'package:burgerking_apitest/Service/globalContraoller.dart';
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
     
      default:
        return MaterialPageRoute(
            builder: (_) => NavigationErrorPage(
                  errorPageName: settings.name,
                ));
    }
  }
}
