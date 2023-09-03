

import 'package:burgerking_apitest/Shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGAppBarItem extends StatelessWidget {
  final String pageName;
  final String iconPath;
  final String activeIconPath;
  final bool isPressed;
  final String title;
  final String activeTitle;

  const SVGAppBarItem(
      {Key? key,
      required this.activeTitle,
      required this.title,
      required this.pageName,
      required this.iconPath,
      required this.activeIconPath,
      required this.isPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Styles.of(context).darkblue,
      child: Column(
        children: [
        IconButton(
          icon: SvgPicture.asset(
            isPressed ? activeIconPath : iconPath,
            
            color: isPressed ? Colors.red : Colors.grey,
          ),
          iconSize: 20,
          onPressed: () {
            if (!isPressed) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(pageName, (route) => false);
            }
          },
        ),
        Text(
          activeTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
            color: isPressed ? Colors.white : Colors.white,
          ),
        )
      ]),
    );
  }
}
