
import 'package:burgerking_apitest/Shared/styles.dart';

import 'package:flutter/material.dart';

class NavigationErrorPage extends StatelessWidget {
  final String? errorPageName;
  const NavigationErrorPage({Key? key, this.errorPageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          Image.asset("assets/icons/planhero-splash-250.png",
              width: 70, height: 70),
          const SizedBox(height: 10),
          Text(
            'planhero',
            textAlign: TextAlign.center,
            style: Styles.of(context).big(context, color: Colors.amber),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "ERROR: the Page you're trying to open doesn't exist in ph_router, please add its name. PageName: " +
                  (errorPageName ?? "no name entered"),
              style: Styles.of(context).big(context),
            ),
          ),
        ],
      )),
    );
  }
}
