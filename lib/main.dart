
import 'package:burgerking_apitest/Screen/HomeScreen/home_screem.dart';
import 'package:burgerking_apitest/Service/Setup/data_layer_setup.dart';

import 'package:burgerking_apitest/Shared/approuter.dart';

import 'package:burgerking_apitest/Shared/global_contraoller.dart';
import 'package:burgerking_apitest/Shared/styles.dart';
import 'package:burgerking_apitest/Shared/utilities.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'test_mode.dart' as flags;






Future<void> main() async {

  await DataLayerSetup.initialize();
 
  // Only set the ErrorWidget.builder in non-test modes.
  if (flags.isInTestMode==false) {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Lottie.asset("assets/error.json"),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Fehlermeldung:\n${details.exception} \n\n Bitte den Kundenservice kontaktieren und ein Screenshot der Fehlermeldung schicken...!',
                    style: const TextStyle(color: Colors.yellow, fontSize: 15),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    };
  }

  runApp(ChangeNotifierProvider<GlobalController>(
    create: (_) => GlobalController(),
    child:  const Styles(child: MyApp()),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
         Provider.of<GlobalController>(context, listen: false);
    const String initialPage = HomeScreen.pageName;
    return 
   Utils(
      globalController: Provider.of<GlobalController>(context),
      child:
      MaterialApp(
        debugShowCheckedModeBanner: false,
       
      initialRoute: initialPage,
        onGenerateRoute: AppRouter.generateRoute,
        locale: Provider.of<GlobalController>(context).locale,
        title: 'My one and only Royal Experience is Burger Kind',
       theme: ThemeData.dark().copyWith(
        canvasColor: Styles.of(context).darkblue,
      ),
        // home:   MyHomePage(),
      ),
    );
  }
}


