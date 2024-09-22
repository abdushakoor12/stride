import 'package:stride/data/model/habits/habit.dart';
import 'package:stride/data/model/habits/habit_completion.dart';
import 'package:stride/data/model/habits/habit_repo.dart';

class FakeHabitRepo extends HabitRepo {
  final List<Habit> habits = [];

  @override
  Future<void> insertHabit(Habit habit) async {
    habits.add(habit);
  }

  @override
  Stream<List<Habit>> watchHabits() {
    return Stream.value(habits);
  }

  @override
  Stream<HabitCompletion?> watchHabitCompletion(String habitId,
      DateTime dateTime) {
    return Stream.value(null);
  }

  @override
  Stream<List<HabitCompletion>> watchHabitCompletions(DateTime dateTime) {
    return Stream.value([]);
  }

  @override
  Future<void> deleteHabitCompletion(String id, DateTime dateTime) async {

  }

  @override
  Future<void> insertHabitCompletion(String habitId, DateTime dateTime) async {

  }
}