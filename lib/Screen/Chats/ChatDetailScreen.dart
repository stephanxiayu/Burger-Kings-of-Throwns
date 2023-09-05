import 'package:burgerking_apitest/Components/AppScaffold.dart';
import 'package:burgerking_apitest/Shared/styles.dart';

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Service/DataModels/chatScreenModel.dart';

class ChatDetailScreen extends StatefulWidget {
  static const String pageName = "Chat";
   final String characterId;  // This is the unique ID for the character
  final String url;

  ChatDetailScreen({Key? key, required this.characterId, required this.url }) : super(key: key);

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  TextEditingController textEditingController = TextEditingController();
  List<ChatMessage> currentChats = [];
FocusNode textFocus = FocusNode();


  @override
  void initState() {
    super.initState();
    
    _loadChatData();
    textFocus.addListener(() {
        print("Has focus: ${textFocus.hasFocus}");
    });
  }
  @override
void dispose() {
  textFocus.dispose();
  super.dispose();
}

_loadChatData() async {
  final prefs = await SharedPreferences.getInstance();
  final savedChats = prefs.getStringList('chats') ?? [];
  setState(() {
    currentChats = savedChats
        .map((chatData) => ChatMessage.fromJson(jsonDecode(chatData)))
        .where((chat) => chat.id == widget.characterId)  // Corrected here
        .toList();
  });
}



void addChatMessage() async {
  if (textEditingController.text.isNotEmpty) {
    final newChat = ChatMessage(
        id: widget.characterId,  // Corrected here
        message: textEditingController.text, 
        imageUrl: widget.url);
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
    return Scaffold(appBar: AppBar(backgroundColor: Styles.of(context).darkblue,title:const Text("be nice...", style: TextStyle(color: Colors.grey),) ),
      backgroundColor: Styles.of(context).darkblue,
      body: Column(
        children: [
          Expanded(flex: 8,
            child: ListView.builder(
              itemCount: currentChats.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  child: ListTile(
                    title: BubbleSpecialThree(sent: true,color: Colors.green,
                      text: 
                  currentChats[index].message),
                    trailing: Image.asset( "assets/bild.jpeg"),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  CircleAvatar(
                  backgroundImage: NetworkImage(widget.url.toString()), // <-- This is the change
                  radius: MediaQuery.of(context).size.width * 0.05, // Adjust the radius if required
                )
                ),
                Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12.0), // Rounded corners
            ),
            width: MediaQuery.of(context).size.width * 0.7,
            child: SingleChildScrollView(
              child: TextField(
                focusNode: textFocus,
                controller: textEditingController,
                cursorColor: Colors.green, // Custom cursor color
                cursorWidth: 2.0, // Custom cursor width
                style: const TextStyle(color: Colors.white, fontSize: 16.0), // Text style
                decoration: const InputDecoration(
                  hintText: 'Type your message...', // Hint text
                  hintStyle: TextStyle(color: Colors.grey), // Hint text style
                  border: InputBorder.none, // No border
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0), // Padding inside the TextField
                ),
                textInputAction: TextInputAction.send, // 'Return' key action
                onSubmitted: (text) {
                 
                  addChatMessage();
                },
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: addChatMessage,
          ),
          
              ],
            ),
          )
        ],
      ),
    );
  }
}


