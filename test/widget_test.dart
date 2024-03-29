// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:character_viewer/injectable_init.dart';
import 'package:character_viewer/services/character_request.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:character_viewer/main_common.dart';

void main() {
  testWidgets('Landing Page Smoke test', (WidgetTester tester) async {
    configureDependencies();
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CommonApp(
      type: CharacterType.simpsonsCharacters,
    ));

    // Verify Character Names and Search have shown up
    expect(find.text('Character Names'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
  });
}
