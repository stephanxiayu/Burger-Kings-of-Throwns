import 'package:burgerking_apitest/Service/globalContraoller.dart';
import 'package:flutter/material.dart';

class ChatController extends ChangeNotifier{
    GlobalController? globalController = GlobalController();
  ChatController(globalController);
}