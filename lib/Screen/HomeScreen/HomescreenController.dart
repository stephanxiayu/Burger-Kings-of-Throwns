

import 'package:burgerking_apitest/Service/globalContraoller.dart';
import 'package:flutter/material.dart';

class HomeScreenController extends ChangeNotifier {
  GlobalController? globalController = GlobalController();
  HomeScreenController(globalController);
}
