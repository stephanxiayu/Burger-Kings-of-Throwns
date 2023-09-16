import 'package:burgerking_apitest/Components/navigation_bar.dart';
import 'package:burgerking_apitest/Components/new_appbar.dart';
import 'package:burgerking_apitest/Shared/global_contraoller.dart';





import 'package:flutter/material.dart';


class AppScaffold extends StatelessWidget {
  final Widget? child;
  final String? selectedPage;
  
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
   
      this.backButton = false,
      this.onFloatTap,
      this.actionButton,
      this.floatingButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
  GlobalController globalController= GlobalController();
    GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
GlobalKey navKey = GlobalKey();


    return Scaffold(
      
       resizeToAvoidBottomInset: true,
        key: globalKey,
      backgroundColor: globalController.darkblue,
        appBar:  NewAppbar(selectedPage: selectedPage),
        body: child,
        bottomNavigationBar: NaviBar(key: navKey,
          selectedPage: selectedPage));
        
  }
}
