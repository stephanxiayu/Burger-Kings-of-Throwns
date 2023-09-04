import 'package:burgerking_apitest/Components/AppScaffold.dart';
import 'package:burgerking_apitest/Screen/Chats/ChatScreens.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatDetailScreen extends StatefulWidget {
  static const String pageName = "Chat";
  final String url;

  ChatDetailScreen({Key? key, required this.url}) : super(key: key);

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  TextEditingController textEditingController = TextEditingController();
  List<ChatMessage> currentChats = [];

  @override
  void initState() {
    super.initState();
    _loadChatData();
  }

  _loadChatData() async {
    final prefs = await SharedPreferences.getInstance();
    final savedChats = prefs.getStringList('chats') ?? [];
    setState(() {
      currentChats = savedChats
          .map((chatData) => ChatMessage.fromJson(jsonDecode(chatData)))
          .toList();
    });
  }

  void addChatMessage() async {
    if (textEditingController.text.isNotEmpty) {
      final newChat = ChatMessage(
          message: textEditingController.text, imageUrl: widget.url);
      setState(() {
        currentChats.add(newChat);
      });

      final prefs = await SharedPreferences.getInstance();
      final savedChats = prefs.getStringList('chats') ?? [];
      savedChats.add(jsonEncode(newChat.toJson()));
      prefs.setStringList('chats', savedChats);

      textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(selectedPage: ChatScreen.pageName,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: currentChats.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(currentChats[index].message),
                  leading: Image.asset( "assets/bild.jpeg"),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  child: Image.network(
                    widget.url,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(controller: textEditingController),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: addChatMessage,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ChatMessage {
  final String message;
  final String imageUrl;

  ChatMessage({required this.message, required this.imageUrl});

  factory ChatMessage.fromJson(Map<String, dynamic> jsonData) {
    return ChatMessage(
      message: jsonData['message'],
      imageUrl: jsonData['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() => {'message': message, 'imageUrl': imageUrl};
}
