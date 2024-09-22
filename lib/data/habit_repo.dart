import 'dart:ui';

import 'package:stride/data/database/app_database.dart';
import 'package:stride/data/habit.dart';
import 'package:stride/locator.dart';

import 'habit_completion.dart';

abstract class HabitRepo {
  Future<void> insertHabit(Habit habit);
  Stream<List<Habit>> watchHabits();
  Stream<HabitCompletion?> watchHabitCompletion(String habitId, DateTime dateTime);
  Stream<List<HabitCompletion>> watchHabitCompletions(DateTime dateTime);
  Future<void> deleteHabitCompletion(String id, DateTime dateTime);
  Future<void> insertHabitCompletion(String habitId, DateTime dateTime);
}

class HabitRepoImpl extends HabitRepo {
  late final AppDatabase db = locator.get<AppDatabase>();

  @override
  Future<void> insertHabit(Habit habit) async {
    await db.into(db.habitRecords).insert(
          HabitRecordsCompanion.insert(
            name: habit.name,
            color: habit.color.value.toString(),
            createdAt: habit.timestamp.millisecondsSinceEpoch,
            id: habit.id,
          ),
        );
  }

  @override
  Stream<List<Habit>> watchHabits() {
    return db.select(db.habitRecords).watch().map((rows) {
      return rows.map((row) {
        return Habit(
          id: row.id,
          name: row.name,
          color: Color(int.parse(row.color)),
          timestamp: DateTime.fromMillisecondsSinceEpoch(row.createdAt),
        );
      }).toList();
    });
  }

  @override
  Stream<HabitCompletion?> watchHabitCompletion(
      String habitId, DateTime dateTime) {
    return db
        .completionOfHabitOnDate(habitId, HabitCompletion.getDateKey(dateTime))
        .watchSingleOrNull()
        .map((row) {
      if (row == null) {
        return null;
      }
      return HabitCompletion(
        habitId: row.habitId,
        timestamp: DateTime.fromMillisecondsSinceEpoch(row.createdAt),
      );
    });
  }

  @override
  Stream<List<HabitCompletion>> watchHabitCompletions(DateTime dateTime) {
    return db
        .completionOfHabitsOnDate(HabitCompletion.getDateKey(dateTime))
        .watch()
        .map((row) {
      return row.map((e) => HabitCompletion(
        habitId: e.habitId,
        timestamp: DateTime.fromMillisecondsSinceEpoch(e.createdAt),
      )).toList();
    });
  }

  @override
  Future<void> deleteHabitCompletion(String id, DateTime dateTime) async {
    (db.delete(db.habitCompletionRecords)
          ..where((tbl) => tbl.habitId.equals(id))
          ..where((tbl) => tbl.dateKey.equals(HabitCompletion.getDateKey(dateTime))))
        .go();
  }

  @override
  Future<void> insertHabitCompletion(String habitId, DateTime dateTime) async {
    db.into(db.habitCompletionRecords).insert(
          HabitCompletionRecordsCompanion.insert(
            habitId: habitId,
            dateKey: HabitCompletion.getDateKey(dateTime),
            createdAt: dateTime.millisecondsSinceEpoch,
          ),
        );
  }
}
