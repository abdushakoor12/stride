import 'package:stride/data/database/app_database.dart';

import 'data/habit_repo.dart';

final di = _DIContainer();

class _DIContainer {
  late final AppDatabase db = AppDatabase();

  Future<void> init() async {

  }

  late final HabitRepo habitRepo = HabitRepo(db);
}
