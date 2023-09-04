
import 'dart:convert';

import 'package:burgerking_apitest/Components/AppScaffold.dart';
import 'package:burgerking_apitest/Screen/Chats/ChatDetailScreen.dart';
import 'package:burgerking_apitest/Service/DataModels/charktermode_class.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
class ChatScreen extends StatefulWidget {
  static const String pageName = "Deine Chats";

  ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Future<List<Item>> items;

  Future<List<Item>> _combineLists() async {
    final liked = await _getFromPrefs('likedItems');
    final superLiked = await _getFromPrefs('superLikedItems');

    List<Item> combined = liked.map((e) => Item(e, false)).toList();
    combined.addAll(superLiked.map((e) => Item(e, true)).toList());

    return combined;
  }

  Future<List<CharacterModel>> _getFromPrefs(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(key) ?? [];
    return data.map((item) => CharacterModel.fromJson(jsonDecode(item))).toList();
  }

  @override
  void initState() {
    super.initState();
    items = _combineLists();
  }

  @override
  Widget build(BuildContext context) {
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
    return GestureDetector(onTap: () {
 Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChatDetailScreen(url:item.imageUrl.toString(),)));
    },
      child: Container(
        height: 150.0,  // <-- define a fixed height
        width: 100.0,  // optional: you can define a width too if you want
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 3.0),
          title:Container(decoration: BoxDecoration(
          border: Border.all(
            color: items[index].isSuperLiked ? Colors.blue : Colors.green,
            width: 2.0,
          ),
        ),
            child: CircleAvatar(child: Image.network(item.imageUrl.toString(), fit: BoxFit.fill))),
         subtitle:   Text(item.firstName.toString(), style: const TextStyle(fontSize: 16.0)),
         
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
          const Expanded(flex: 8,
            child: Text("chats"))
        ],
      ),
    );
  }
}

class Item {
  final CharacterModel character;
  final bool isSuperLiked;

  Item(this.character, this.isSuperLiked);
}
