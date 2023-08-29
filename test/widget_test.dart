// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:burgerking_apitest/CharakterModel/charktermode_class.dart';
import 'package:burgerking_apitest/Service/api_request.dart';

import 'package:flutter_test/flutter_test.dart';



import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }



class MockClient extends Mock implements http.Client {}

void main() {
  group('ApiService', () {
    late ApiService apiService;
    late http.Client mockClient;

    setUp(() {
      mockClient = MockClient();
      apiService = ApiService();
    });

    test('returns a List<CharacterModel> if the http call completes successfully', () async {
    when(mockClient.get(Uri.parse("https://thronesapi.com/api/v2/Characters")))
    .thenAnswer((_) => Future.value(http.Response('[...]', 201)));
// Replace '[...]' with a sample API response.

     expect(await apiService.getCharacters(), isA<List<CharacterModel>>());

    });

    test('throws an exception if the http call completes with an error', () async {
      when(mockClient.get(Uri.parse("https://thronesapi.com/api/v2/Characters")))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(apiService.getCharacters(), throwsException);
    });
  });
}
