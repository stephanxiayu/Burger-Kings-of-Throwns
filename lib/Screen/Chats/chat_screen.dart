
import 'dart:convert';


import 'package:burgerking_apitest/Components/app_scaffold.dart';
import 'package:burgerking_apitest/Screen/Chats/chat_detail_screen.dart';
import 'package:burgerking_apitest/Shared/global_contraoller.dart';
import 'package:burgerking_apitest/core/model/character_models.dart';

import 'package:burgerking_apitest/core/model/items.dart';

import 'package:burgerking_apitest/core/model/chatscreen_model.dart';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../core/model/on_goung_chat.dart';

class ChatScreen extends StatefulWidget {
  static const String pageName = "Deine Chats";

  const ChatScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Future<List<Item>> items;
List<ChatMessage> currentChats = [];
List<OngoingChat> ongoingChats = [];


  Future<List<Item>> _combineLists() async {
    final liked = await _getFromPrefs('likedItems');
    final superLiked = await _getFromPrefs('superLikedItems');

    List<Item> combined = liked.map((e) => Item(e, false)).toList();
    combined.addAll(superLiked.map((e) => Item(e, true)).toList());

    return combined;
  }
Future<List<ChatMessage>> _getChatsForCharacter(String characterId) async {
  final prefs = await SharedPreferences.getInstance();
  final savedChats = prefs.getStringList('chats') ?? [];
  final chats = savedChats
    .map((chatData) => ChatMessage.fromJson(jsonDecode(chatData)))
    .where((chat) => chat.id == characterId)
    .toList();

  return chats;
}


  Future<List<CharacterModel>> _getFromPrefs(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(key) ?? [];
    return data.map((item) => CharacterModel.fromJson(jsonDecode(item))).toList();
  }
  
  Future<void> _fetchOngoingChats() async {
  List<Item> allItems = await items;  // This line waits for the future to complete and get the actual list
  List<OngoingChat> tempOngoingChats = [];

  for (Item item in allItems) {
    List<ChatMessage> chatsForCharacter = await _getChatsForCharacter(item.character.id.toString()); 

    if (chatsForCharacter.isNotEmpty) {
      ChatMessage lastMessage = chatsForCharacter.last;
      OngoingChat ongoingChat = OngoingChat(character: item.character, lastMessage: lastMessage);  // Pass item.character which is of type CharacterModel
      tempOngoingChats.add(ongoingChat);
    }
  }

  if (mounted) {
    setState(() {
      ongoingChats = tempOngoingChats;
    });
  }
}



@override
void initState() {
  super.initState();
  items = _combineLists();
  _fetchOngoingChats();
}

  @override
  Widget build(BuildContext context) {
      GlobalController globalController= GlobalController();
    return AppScaffold(
      selectedPage: ChatScreen.pageName,
      child: Column(
        children: [
          Expanded(flex: 2,
            child: FutureBuilder<List<Item>>(
              future: items,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final items = snapshot.data ?? [];
                  return 
                ListView.builder(
  scrollDirection: Axis.horizontal,
  itemCount: items.length,
  itemBuilder: (context, index) {
    final item = items[index].character;
    return 
GestureDetector(
onTap: () async {

  final chats = await _getChatsForCharacter(item.id.toString());

  if (chats.isNotEmpty) {
    final lastMessage = chats.last;

    final ongoingChatIndex = ongoingChats.indexWhere((chat) => chat.character.id == item.id);
    if (ongoingChatIndex != -1) {
      // Replace with a new instance
      setState(() {
        ongoingChats[ongoingChatIndex] = OngoingChat(character: item, lastMessage: lastMessage);
      });
    } else {
      setState(() {
        ongoingChats.add(OngoingChat(character: item, lastMessage: lastMessage));
      });
    }
  }

  // Navigate to the ChatDetailScreen outside the chats.isNotEmpty condition
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => ChatDetailScreen(characterId: item.id.toString(), url: item.imageUrl.toString())
    )
  );
},


      child: 
     Container(
  height: 150.0,  // <-- define a fixed height
  width: 100.0,   // optional: you can define a width too if you want
  margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),

  child: ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 3.0),
    title: Container(
      decoration: BoxDecoration(shape: BoxShape.circle,
        border: Border.all(
          color: items[index].isSuperLiked ? Colors.blue : Colors.green,
          
          width: 2.0,
        ),
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(item.imageUrl.toString()), // <-- This is the change
        radius: 50.0, // Adjust the radius if required
      )
    ),
    subtitle: Text(item.firstName.toString(), style: const TextStyle(fontSize: 16.0)),
  ),
),

    );
  },
);

                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
       Expanded(
  flex: 7,
  child: ongoingChats.isNotEmpty
      ? ListView.builder(
         key: const Key('chatListView'),
          itemCount: ongoingChats.length,
          itemBuilder: (context, index) {
            final chat = ongoingChats[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChatDetailScreen(
                      characterId: chat.character.id.toString(),
                      url: chat.character.imageUrl.toString(),
                    ),
                  ),
                );
              },
              child: Card(elevation: 9,
                color: globalController.darkblue,
                child: ListTile(
                  title:   Text(chat.character.firstName.toString(),
                      style: const TextStyle(color: Colors.white)),
                  leading: Image.network(chat.character.imageUrl.toString()),
                  subtitle: Text("${chat.lastMessage.message}....",
                      style: const TextStyle(color: Colors.grey, )),
               
                ),
              ),
            );
          },
        )
      : const Center(child: Text('like and chatte with a King of the months')),
),



        ],
      ),
    );
  }
}


