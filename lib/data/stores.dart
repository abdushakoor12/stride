import 'package:loon/loon.dart';
import 'package:stride/data/habit.dart';
import 'package:stride/data/habit_completion.dart';

Collection<Habit> habitStore = Loon.collection<Habit>(
  'habits',
  fromJson: Habit.fromJson,
  toJson: (habit) => habit.toJson(),
);

Collection<HabitCompletion> habitCompletionStore =
    Loon.collection<HabitCompletion>(
  'habit_completions',
  fromJson: HabitCompletion.fromJson,
  toJson: (completion) => completion.toJson(),
);
