import 'package:burgerking_apitest/Components/NavigationBar.dart';
import 'package:burgerking_apitest/Components/NewAppbar.dart';

import 'package:burgerking_apitest/Shared/globalContraoller.dart';
import 'package:burgerking_apitest/Shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    GlobalController globalController = Provider.of<GlobalController>(context);
    GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();


    return Scaffold(
        key: globalKey,
      backgroundColor: Styles.of(context).darkblue,
        appBar: NewAppbar(selectedPage: selectedPage),
        body: child,
        bottomNavigationBar: NaviBar(selectedPage: selectedPage));
        
  }
}
