import 'package:burgerking_apitest/Service/DataModels/charktermode_class.dart';
import 'package:burgerking_apitest/Service/DataModels/chatscreen_model.dart';


class OngoingChat {
  final CharacterModel character;
  ChatMessage lastMessage;  // removed the 'late' keyword here

  OngoingChat({required this.character, required this.lastMessage});
}