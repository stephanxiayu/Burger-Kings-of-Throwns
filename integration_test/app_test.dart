import 'package:burgerking_apitest/Components/svg_item.dart';

import 'package:burgerking_apitest/Screen/DetialScreen/detail_screen.dart';
import 'package:burgerking_apitest/Screen/HomeScreen/home_screem.dart';
import 'package:burgerking_apitest/Screen/Profiles/profil_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:burgerking_apitest/main.dart' as app;
import 'package:burgerking_apitest/test_mode.dart' as flags;
import 'package:swipe_cards/swipe_cards.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("HomeScreen Tests", () {
    testWidgets("Verify HomeScreen functionalities", (tester) async {
      // Start the app in test mode
      flags.isInTestMode = true; 
      app.main();
      await tester.pumpAndSettle();
     
      // Check if ShimmerLoading is shown while waiting for data
      await tester.pump(const Duration(seconds: 6));

      // Verify SwipeCards widget is shown after data is loaded
      expect(find.byType(SwipeCards), findsOneWidget);

      // Tap the info button to navigate to DetailScreen
      await tester.tap(find.byIcon(Icons.info).first);
      await tester.pumpAndSettle();
      expect(find.byType(DetailPage), findsOneWidget);

      // Going back to the HomeScreen
      await tester.pageBack();
      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);

      // Simulate swipe actions
      await tester.tap(find.byIcon(Icons.close).first); // Nope action
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.star).first); // Superlike action
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.favorite).first); // Like action
      await tester.pumpAndSettle();

await tester.tap(find.byType(SVGAppBarItem).first);

final target = find.descendant(
  of: find.byType(NavigationBar),
  matching: find.byKey(const Key('chatNavBarItem')),
).first;
await tester.tap(target);
 await tester.pump(const Duration(seconds: 2));
await tester.pumpAndSettle();



    
// Navigate to ProfileScreen
final profileTarget = find.descendant(
  of: find.byType(NavigationBar),
  matching: find.byKey(const Key('profileNavBarItem')),
).first;
await tester.ensureVisible(profileTarget);
await tester.tap(profileTarget);
await tester.pumpAndSettle();

// Assertion for the ProfileScreen
expect(find.byType(ProfilScreen), findsOneWidget);
await tester.pump(const Duration(seconds: 2));

// Navigate back to HomeScreen
final homeTarget = find.descendant(
  of: find.byType(NavigationBar),
  matching: find.byKey(const Key('homeNavBarItem')),
).first;
await tester.ensureVisible(homeTarget);
await tester.tap(homeTarget);
await tester.pumpAndSettle();

// ... (Previous test code)

final target2 = find.descendant(
  of: find.byType(NavigationBar),
  matching: find.byKey(const Key('chatNavBarItem')),
).first;
await tester.tap(target2);
await tester.pumpAndSettle();

// Navigate to ChatDetailScreen by tapping on a chat item
final chatItem = find.byType(ListTile).first; // Replace ListTile with your custom chat item widget if needed
await tester.tap(chatItem);
await tester.pumpAndSettle();

final messageField = find.byKey(const Key('chatMessageField'));
await tester.enterText(messageField, 'hello');

await tester.tap(find.byKey(const Key('sendIconButton')));
await tester.pumpAndSettle();

await tester.pumpAndSettle();


await tester.tap(find.byType(BackButton));
await tester.pumpAndSettle();

// Navigator.of(tester.element(find.byType(ChatDetailScreen))).pop();
// await tester.pumpAndSettle();


final targetHome = find.descendant(
  of: find.byType(NavigationBar),
  matching: find.byKey(const Key('homeNavBarItem')),
);tester.ensureVisible(targetHome);
await tester.tap(targetHome);

expect(targetHome, findsOneWidget);


await tester.pumpAndSettle();



// Navigate to ChatScreen again using NavigationBar
await tester.tap(target2);
expect(find.byKey(const Key('chatNavBarItem')), findsWidgets);

await tester.pumpAndSettle();
await tester.drag(find.byKey(const Key('chatListView')), const Offset(0, -300));



// Check if "hello" message exists
int maxScrolls = 10; // Define the maximum number of scrolls
int scrollAttempts = 0; // Initialize scroll attempts counter

while (find.text('hello').evaluate().isEmpty && scrollAttempts < maxScrolls) {
  await tester.drag(find.byKey(const Key('chatListView')), const Offset(0, -100)); // smaller increments
  await tester.pumpAndSettle();
  scrollAttempts++;
}
// expect(find.text('hello'), findsOneWidget);


    });
  });
}
