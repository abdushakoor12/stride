import 'dart:ui';

import 'package:stride/data/database/app_database.dart';
import 'package:stride/data/habit.dart';

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
}
