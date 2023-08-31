
import 'package:burgerking_apitest/Components/AppScaffold.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
    static const String pageName = "ChatScreen";
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(child: Center(child: Text("Chat"),),);
  }
}