

import 'package:burgerking_apitest/Components/AppScaffold.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});
      static const String pageName = "ProfilScreen";

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      child: Center(child: Text("profilscreen"),),
    );
  }
}