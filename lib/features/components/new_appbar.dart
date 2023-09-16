

import 'package:burgerking_apitest/Screen/HomeScreen/home_screem.dart';
import 'package:burgerking_apitest/Shared/global_contraoller.dart';

import 'package:flutter/material.dart';


class NewAppbar extends StatelessWidget implements PreferredSizeWidget {

   const NewAppbar({super.key, this.title,    this.selectedPage,});
   final String ?title;
final String? selectedPage;
  @override
  Widget build(BuildContext context) {
    GlobalController globalController= GlobalController();
    return  AppBar(title:  Text(selectedPage == HomeScreen.pageName?"Tinder of Throwns": selectedPage.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
  backgroundColor: globalController.darkblue,);
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
