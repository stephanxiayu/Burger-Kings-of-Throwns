
import 'package:flutter/material.dart';

class GlobalController extends ChangeNotifier {

   Locale locale = const Locale("de");



  final Color darkblue =const Color.fromARGB(255, 17, 35, 50);

  void showSuccess(BuildContext context, String message) {
    _showSnackBar(context, Colors.transparent, message);
  }

  

  void showFail(BuildContext context, String message) {
    _showSnackBar(context, Colors.red, message);
  }

  void _showSnackBar(BuildContext context, Color color, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: color,
        content: Text(
          message,
          textAlign: TextAlign.center,
        
        )));
  }

  ButtonStyle buttonStyle() {
    return ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}