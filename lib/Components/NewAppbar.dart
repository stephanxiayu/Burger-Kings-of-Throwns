

import 'package:burgerking_apitest/Shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewAppbar extends StatelessWidget implements PreferredSizeWidget {
  String ?title;
   NewAppbar({super.key, this.title,    this.selectedPage,});
  
final String? selectedPage;
  @override
  Widget build(BuildContext context) {
    return  AppBar(title: Text(title?? ""),
  backgroundColor: Styles.of(context).darkblue,);
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
