
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewAppbar extends StatelessWidget implements PreferredSizeWidget {
  const NewAppbar({super.key,    required this.selectedPage,});
final String? selectedPage;
  @override
  Widget build(BuildContext context) {
    return  AppBar();
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
