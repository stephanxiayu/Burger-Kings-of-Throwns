import 'package:burgerking_apitest/Components/svg_item.dart';
import 'package:burgerking_apitest/Screen/Chats/chat_screen.dart';
import 'package:burgerking_apitest/Screen/HomeScreen/home_screem.dart';
import 'package:burgerking_apitest/Screen/Profiles/profil_screen.dart';
import 'package:burgerking_apitest/Shared/global_contraoller.dart';



import 'package:flutter/material.dart';


class NaviBar extends StatelessWidget {
  final String? selectedPage;

  const NaviBar({
    Key? key,
    this.selectedPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  GlobalController globalController= GlobalController();

    return NavigationBar(
         key: const Key('chatNavBarItem'),
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      backgroundColor: globalController.darkblue,
      height: 70,
      destinations: [
        Card(
          child: SVGAppBarItem(
            key: const Key('homeNavBarItem'),
            pageName: HomeScreen.pageName,
            iconPath: 'assets/SVG/tinder2.svg',
            activeIconPath: 'assets/SVG/tinder.svg',
            isPressed: selectedPage == HomeScreen.pageName,
            title: "Home",
            activeTitle: "Home",
          ),
        ),
        Card(
          child: SVGAppBarItem(
            key: const Key('chatNavBarItem'),
            pageName: ChatScreen.pageName,
            iconPath: 'assets/SVG/chat.svg',
            activeIconPath: 'assets/SVG/chat.svg',
            isPressed: selectedPage == ChatScreen.pageName,
            title: "Chats",
            activeTitle: "Chats",
          ),
        ),
        Card(
          child: SVGAppBarItem(
            key: const Key('profileNavBarItem'),
            pageName: ProfilScreen.pageName,
            iconPath: 'assets/SVG/profil.svg',
            activeIconPath: 'assets/SVG/profil.svg',
            isPressed: selectedPage == ProfilScreen.pageName,
            title: "Profile",
            activeTitle: "Profile",
          ),
        ),
      ],
    );
  }
}
