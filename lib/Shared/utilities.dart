
import 'package:burgerking_apitest/Shared/globalContraoller.dart';
import 'package:flutter/material.dart';

class Utils extends InheritedWidget {
    final GlobalController globalController;
      Utils({Key? key, required Widget child, required this.globalController})
      : super(key: key, child: child);
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
   return oldWidget is Utils &&
        globalController.locale != oldWidget.globalController.locale;
  }
}