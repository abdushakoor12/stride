import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stride/data/habit_repo.dart';
import 'package:stride/locator.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: calendarChangeNotifier,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                DateFormat('MMMM yyyy')
                    .format(calendarChangeNotifier.monthTime.dateTime),
              ),
              actions: [
                IconButton(
                  onPressed: calendarChangeNotifier.previousMonth,
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                IconButton(
                  onPressed: calendarChangeNotifier.nextMonth,
                  icon: const Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
            body: GridView.count(
              crossAxisCount: 7,
              children: [
                ...["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
                    .map((day) => Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(0.1),
                              ),
                              child: Center(
                                  child: Text(day,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ))),
                            ),
                          ],
                        )),
                ...List.generate(calendarChangeNotifier.emptyDaysAtStart,
                    (index) => const SizedBox()),
                ...calendarChangeNotifier.daysOfMonth
                    .map((day) => StreamBuilder(
                        stream: locator.get<HabitRepo>().watchHabitCompletions(day),
                        builder: (context, snapshot) {
                          final completions = snapshot.data ?? [];
                          return Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(0.1),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      bottom: 3,
                                      right: 0,
                                      left: 0,
                                      child: Text(
                                        day.day.toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      )),
                                  Positioned.fill(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Wrap(
                                        spacing: 2,
                                        runSpacing: 2,
                                        children: [
                                          for (final _ in completions)
                                            Container(
                                              width: 5,
                                              height: 5,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ));
                        }))
              ],
            ),
          );
        });
  }
}

final calendarChangeNotifier = CalendarChangeNotifier();

class CalendarChangeNotifier extends ChangeNotifier {
  MonthTime _monthTime = MonthTime.now();

  MonthTime get monthTime => _monthTime;

  List<DateTime> get daysOfMonth => _monthTime.daysOfMonth;

  int get emptyDaysAtStart {
    final firstDay = DateTime(_monthTime.year, _monthTime.month);
    return firstDay.weekday - 1;
  }

  void nextMonth() {
    _monthTime = _monthTime.next();
    notifyListeners();
  }

  void previousMonth() {
    _monthTime = _monthTime.previous();
    notifyListeners();
  }
}

class MonthTime {
  final int month;
  final int year;

  MonthTime({required this.month, required this.year});

  factory MonthTime.fromDateTime(DateTime dateTime) {
    return MonthTime(
      month: dateTime.month,
      year: dateTime.year,
    );
  }

  DateTime get dateTime {
    return DateTime(year, month);
  }

  factory MonthTime.now() {
    return MonthTime.fromDateTime(DateTime.now());
  }

  MonthTime next() {
    if (month == 12) {
      return MonthTime(month: 1, year: year + 1);
    }
    return MonthTime(month: month + 1, year: year);
  }

  MonthTime previous() {
    if (month == 1) {
      return MonthTime(month: 12, year: year - 1);
    }
    return MonthTime(month: month - 1, year: year);
  }
}

extension MonthTimeExtension on MonthTime {
  List<DateTime> get daysOfMonth {
    final firstDay = DateTime(year, month);
    final lastDay = DateTime(year, month + 1, 0, 0, 0, 0, 0);
    return List.generate(lastDay.difference(firstDay).inDays, (index) {
      return firstDay.add(Duration(days: index));
    });
  }
}
