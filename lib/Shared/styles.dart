import 'package:flutter/material.dart';

class Styles extends InheritedWidget {
   const Styles({Key? key, required Widget child})
      : super(key: key, child: child);
      static const double headLine3 = 50;
  static const double headLine4 = 36;
  static const double headLine5 = 28;
  static const double headLine6 = 21; //bold

  static const double subtitle1 = 24;
  static const double subtitle2 = 18; // bold

  static const double body1 = 20;
  static const double body2 = 18;

  static const double caption = 16;

  static const double button = 16; // bold CAPS

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
          style: textStyle(
            size: 20,
          ),
        )));
  }

  TextStyle big(context, {Color? color}) => TextStyle(
      fontSize: 22,
      fontFamily: 'LatoLight',
      color: color ?? Theme.of(context).textTheme.displayLarge!.color);

  TextStyle medium(context, {Color? color, FontWeight? weight}) => TextStyle(
      fontSize: 20,
      fontFamily: 'LatoLight',
      fontWeight: weight,
      color: color ?? Theme.of(context).textTheme.displayLarge!.color);

  TextStyle small(context, {Color? color, FontWeight? weight}) => TextStyle(
      fontSize: 11,
      fontFamily: 'LatoLight',
      fontWeight: weight,
      color: color ?? Theme.of(context).textTheme.bodyLarge!.color);

  TextStyle superSmall(context, {Color? color, FontWeight? weight}) =>
      TextStyle(
          fontSize: 12,
          fontWeight: weight,
          fontFamily: 'LatoLight',
          color: color ?? Theme.of(context).textTheme.bodyLarge!.color);

  TextStyle textStyle({double size = 25, Color? color}) {
    return TextStyle(
        fontFamily: "LatoLight",
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold);
  }

  TextStyle title() => const TextStyle(fontFamily: "LatoLight", fontSize: 30);

  InputDecoration textFieldDecoration(BuildContext context,
      {String? label,
      Widget? prefixIcon,
      Widget? suffixIcon,
      String? hintText}) {
    InputDecoration textFieldDecoration = InputDecoration(
      labelText: label,
      filled: true,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      hintText: hintText,
      fillColor: const Color(0xff35424d),
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(20)),
    );
    return textFieldDecoration;
  }

  ButtonStyle buttonStyle() {
    return ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  static Styles of(BuildContext context) {
    final Styles? result = context.dependOnInheritedWidgetOfExactType<Styles>();
    assert(result != null, 'No Styles found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Styles oldWidget) {
    return false;
  }
}
