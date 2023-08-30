import 'package:burgerking_apitest/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'test_mode.dart' as flags;






void main() {
  // Only set the ErrorWidget.builder in non-test modes.
  if (flags.isInTestMode==false) {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Lottie.asset("assets/error.json"),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Fehlermeldung:\n${details.exception} \n\n Bitte den Kundenservice kontaktieren und ein Screenshot der Fehlermeldung schicken...!',
                    style: const TextStyle(color: Colors.yellow, fontSize: 15),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    };
  }

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

