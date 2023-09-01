
import 'package:burgerking_apitest/Components/SVG_item.dart';
import 'package:burgerking_apitest/Screen/Chats/ChatScreens.dart';
import 'package:burgerking_apitest/Screen/HomeScreen/HomeScreen.dart';
import 'package:burgerking_apitest/Screen/Profiles/ProfilScreen.dart';
import 'package:burgerking_apitest/Shared/globalContraoller.dart';
import 'package:burgerking_apitest/Shared/styles.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NaviBar extends StatelessWidget {
  final String? selectedPage;

  NaviBar({
    Key? key,
    this.selectedPage,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    GlobalController globalController = Provider.of<GlobalController>(context);

    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      backgroundColor: Styles.of(context).darkblue,
      height: 70,
      destinations: [
               Card(
          
        
        
          elevation: selectedPage == HomeScreen.pageName ? 9 : 0,
          child: SVGAppBarItem(
            pageName: HomeScreen.pageName,
            iconPath: 'assets/SVG/tinder2.svg',
            activeIconPath: 'assets/SVG/tinder.svg',
            isPressed: selectedPage == HomeScreen.pageName,
            title:  "Home",
            activeTitle: "Home",
          ),
        ),
                Card(
          
        
        
          elevation: selectedPage == ChatScreen.pageName ? 9 : 0,
          child: SVGAppBarItem(
            pageName: ChatScreen.pageName,
           iconPath: 'assets/SVG/chat.svg',
            activeIconPath: 'assets/SVG/chat.svg',
            isPressed: selectedPage == ChatScreen.pageName,
            title:  "Chats",
            activeTitle: "Chats",
          ),
        ),
                 Card(
          
        
        
          elevation: selectedPage == ProfilScreen.pageName ? 9 : 0,
          child: SVGAppBarItem(
            pageName: ProfilScreen.pageName,
            iconPath: 'assets/SVG/profil.svg',
            activeIconPath: 'assets/SVG/profil.svg',
            isPressed: selectedPage == ProfilScreen.pageName,
            title:  "Profile",
            activeTitle: "Profile",
          ),
        ),
      ],
    );
  }
}
