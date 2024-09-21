// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stride/data/database/app_database.dart';
import 'package:stride/locator.dart';

import 'package:stride/main.dart';
import 'package:stride/ui/home/home_screen.dart';

void main() {

  setUp(() {
    locator.overrideLazily<AppDatabase>(() => AppDatabase.memory());
  });

  tearDown(() {
    locator.get<AppDatabase>().close();
  });

  testWidgets('Smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);

    // workaround for timer issue
    await tester.pumpWidget(Container());
    await tester.pumpAndSettle();
  });
}
