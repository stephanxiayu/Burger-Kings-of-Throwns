import 'package:burgerking_apitest/Screen/DetailPage.dart';
import 'package:burgerking_apitest/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:burgerking_apitest/main.dart' as app;
import 'package:burgerking_apitest/test_mode.dart' as flags;


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Scroll ListView and Navigate", () {
    testWidgets("Verify scrolling of the list and navigate to DetailPage", (tester) async {
      // Start the app
        flags.isInTestMode = true; 
      app.main();
      await tester.pumpAndSettle();

      // Scroll the ListView a little bit
      await tester.drag(find.byType(ListView), Offset(0, -300)); // Scroll upwards by 300 pixels
      await tester.pumpAndSettle();

      // Tap on the first card after scrolling
      await tester.tap(find.byType(Card).first);
      await tester.pumpAndSettle();

      // Check if DetailPage is displayed
      expect(find.byType(DetailPage), findsOneWidget);
      await tester.pageBack();
      await tester.pumpAndSettle();

      // Check if HomeScreen is displayed again
      expect(find.byType(HomeScreen), findsOneWidget);

      await tester.pumpAndSettle();

    });
  });
}
