import 'dart:ui';

import 'package:drift/internal/versioned_schema.dart';
import 'package:stride/data/database/app_database.dart';
import 'package:stride/data/habit.dart';

import 'habit_completion.dart';

class HabitRepo {
  final AppDatabase db;

  HabitRepo(this.db);

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

  void deleteHabitCompletion(String id, DateTime dateTime) {
    (db.delete(db.habitCompletionRecords)
          ..where((tbl) => tbl.habitId.equals(id))
          ..where((tbl) => tbl.dateKey.equals(HabitCompletion.getDateKey(dateTime))))
        .go();
  }

  void insertHabitCompletion(String habitId, DateTime dateTime) {
    db.into(db.habitCompletionRecords).insert(
          HabitCompletionRecordsCompanion.insert(
            habitId: habitId,
            dateKey: HabitCompletion.getDateKey(dateTime),
            createdAt: dateTime.millisecondsSinceEpoch,
          ),
        );
  }
}
