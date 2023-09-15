

import 'package:burgerking_apitest/Screen/HomeScreen/home_screem.dart';
import 'package:burgerking_apitest/Shared/styles.dart';
import 'package:flutter/material.dart';


class NewAppbar extends StatelessWidget implements PreferredSizeWidget {
  String ?title;
   NewAppbar({super.key, this.title,    this.selectedPage,});
  
final String? selectedPage;
  @override
  Widget build(BuildContext context) {
    return  AppBar(title:  Text(selectedPage == HomeScreen.pageName?"Tinder of Throwns": selectedPage.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
  backgroundColor: Styles.of(context).darkblue,);
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
