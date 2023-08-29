import 'package:burgerking_apitest/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'My one and only Royal Experience is Burger Kind',
      theme: ThemeData.dark(
       
       
      ),
      home:  const HomeScreen(),
    );
  }
}

