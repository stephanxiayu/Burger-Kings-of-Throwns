import 'package:burgerking_apitest/core/model/character_models.dart';
import 'package:burgerking_apitest/core/model/chatscreen_model.dart';


class OngoingChat {
  final CharacterModel character;
  ChatMessage lastMessage;  // removed the 'late' keyword here

  OngoingChat({required this.character, required this.lastMessage});
}