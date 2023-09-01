
import 'dart:convert';

import 'package:burgerking_apitest/Components/AppScaffold.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../CharakterModel/charktermode_class.dart';
class ChatScreen extends StatefulWidget {
  static const String pageName = "ChatScreen";
  
  ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Future<List<CharacterModel>> likedItems;
  late Future<List<CharacterModel>> superLikedItems;

  Future<List<CharacterModel>> _getFromPrefs(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(key) ?? [];
    return data.map((item) => CharacterModel.fromJson(jsonDecode(item))).toList();
  }

  @override
  void initState() {
    super.initState();
    likedItems = _getFromPrefs('likedItems');
    superLikedItems = _getFromPrefs('superLikedItems');
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        children: [
          Text("Liked:"),
          Expanded(
            child: FutureBuilder<List<CharacterModel>>(
              future: likedItems,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final items = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(items[index].fullName.toString()),
                        leading: Image.network(items[index].imageUrl.toString(), width: 50, fit: BoxFit.cover),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Text("Superliked:"),
          Expanded(
            child: FutureBuilder<List<CharacterModel>>(
              future: superLikedItems,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final items = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(items[index].fullName.toString()),
                        leading: Image.network(items[index].imageUrl.toString(), width: 50, fit: BoxFit.cover),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
