// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stride/data/model/habits/habit.dart';
import 'package:stride/data/model/habits/habit_repo.dart';
import 'package:stride/core/locator.dart';
import 'package:stride/main.dart';
import 'package:stride/view/home/home_screen.dart';

import 'helpers/fake_habit_repo.dart';

void main() {
  late HabitRepo habitRepo;

  setUp(() {
    habitRepo = FakeHabitRepo();
    locator.override<HabitRepo>(habitRepo);
  });

  tearDown(() async {});

  testWidgets('Smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('Show No Habites View when no habits',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);

    final habitList = find.byType(ListView);
    expect(habitList, findsNothing);

    final noHabits = find.text('No Habits Found');
    expect(noHabits, findsOneWidget);
  });

  testWidgets('Habit List', (WidgetTester tester) async {
    final habit1 = Habit(
      id: '1',
      name: 'Habit 1',
      color: Colors.green,
      timestamp: DateTime.now(),
    );

    final habit2 = Habit(
      id: '2',
      name: 'Habit 2',
      color: Colors.blue,
      timestamp: DateTime.now(),
    );

    final habitRepo = locator.get<HabitRepo>();
    await habitRepo.insertHabit(habit1);
    await habitRepo.insertHabit(habit2);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);

    final habitList = find.byType(ListView);
    expect(habitList, findsOneWidget);

    final habitCard = find.byType(Card);
    expect(habitCard, findsNWidgets(2));
  });
}
