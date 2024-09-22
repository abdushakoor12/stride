import 'package:flutter_test/flutter_test.dart';
import 'package:stride/data/database/app_database.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AppDatabase db;

  setUp(() {
    db = AppDatabase.memory();
  });

  tearDown(() async {
    await db.close();
  });

  test('Habit Records', () async {
    final habitRecords = db.habitRecords;

    var dateTime = DateTime.now();

    await db.into(habitRecords).insert(
      HabitRecordsCompanion.insert(
        name: 'Habit 1',
        color: '0xFF00FF00',
        createdAt: dateTime.millisecondsSinceEpoch,
        id: '1',
      ),
    );

    final habit = await db.select(habitRecords).getSingle();
    expect(habit.name, 'Habit 1');
    expect(habit.color, '0xFF00FF00');
    expect(habit.createdAt, dateTime.millisecondsSinceEpoch);
    expect(habit.id, '1');
  });

  test("Habit Completions", () async {
    final habitRecords = db.habitRecords;
    final habitCompletionRecords = db.habitCompletionRecords;

    final habit = await db.into(habitRecords).insert(
      HabitRecordsCompanion.insert(
        name: 'Habit 1',
        color: '0xFF00FF00',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: '1',
      ),
    );

    var dateTime = DateTime.now();

    await db.into(habitCompletionRecords).insert(
      HabitCompletionRecordsCompanion.insert(
        habitId: '1',
        dateKey: '2023-01-01',
        createdAt: dateTime.millisecondsSinceEpoch,
      ),
    );

    final completion = await db.completionOfHabitsOnDate('2023-01-01').get();
    expect(completion.length, 1);
    expect(completion.first.habitId, '1');
    expect(completion.first.dateKey, '2023-01-01');
    expect(completion.first.createdAt, dateTime.millisecondsSinceEpoch);
  });
}