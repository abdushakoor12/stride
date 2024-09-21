import 'package:stride/data/database/app_database.dart';

class HabitRepo {
  final AppDatabase db;

  HabitRepo(this.db);

  Future<void> insertHabit(Habit habit) async {
    await db.into(db.habits).insert(habit);
  }
}