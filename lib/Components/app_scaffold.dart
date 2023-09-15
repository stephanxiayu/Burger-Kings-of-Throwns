import 'package:burgerking_apitest/Components/navigation_bar.dart';
import 'package:burgerking_apitest/Components/new_appbar.dart';




import 'package:burgerking_apitest/Shared/styles.dart';
import 'package:flutter/material.dart';


class AppScaffold extends StatelessWidget {
  final Widget? child;
  final String? selectedPage;
  final AppBar? appBar;
  final NaviBar? naiBar;
  final bool backButton;
  final Widget? floatingButton;
  final Function()? onFloatTap;
  final bool? actionButton;

  const AppScaffold(
      {Key? key,
      this.child,
      this.naiBar,
      this.selectedPage,
      this.appBar,
      this.backButton = false,
      this.onFloatTap,
      this.actionButton,
      this.floatingButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
GlobalKey navKey = GlobalKey();


    return Scaffold(
      
       resizeToAvoidBottomInset: true,
        key: globalKey,
      backgroundColor: Styles.of(context).darkblue,
        appBar: NewAppbar(selectedPage: selectedPage),
        body: child,
        bottomNavigationBar: NaviBar(key: navKey,
          selectedPage: selectedPage));
        
  }
}
