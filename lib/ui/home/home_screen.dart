import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stride/data/habit.dart';
import 'package:stride/data/habit_completion.dart';
import 'package:stride/di.dart';
import 'package:stride/ui/add_habit/add_habit_screen.dart';
import 'package:stride/ui/calendar/calendar_screen.dart';
import 'package:stride/utils/color_ext.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Habit> habits = [];

  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    _subscription = di.habitRepo.watchHabits().listen((value) {
      setState(() {
        habits = value;
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CalendarScreen(),
                ),
              );
            },
            icon: const Icon(Icons.calendar_today),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          final habit = habits[index];
          return Card(
            margin: const EdgeInsets.all(8),
            color: habit.color,
            child: ListTile(
                title: Text(
                  habit.name,
                  style: TextStyle(
                    color: habit.color.foregroundByLuminance,
                    fontSize: 20,
                  ),
                ),
                // trailing: QueryStreamBuilder<HabitCompletion>(
                //     query: habitCompletionStore.where(
                //       (e) =>
                //           e.data.habitId == habit.id &&
                //           e.data.key ==
                //               HabitCompletion.getCompletionKey(
                //                   habit.id, DateTime.now()),
                //     ),
                //     builder: (context, snaps) {
                //       final isCompleted = snaps.isNotEmpty;
                //       return GestureDetector(
                //         onTap: () {
                //           final key = HabitCompletion.getCompletionKey(
                //             habit.id,
                //             DateTime.now(),
                //           );
                //
                //           if (isCompleted) {
                //             habitCompletionStore.doc(key).delete();
                //           } else {
                //             habitCompletionStore
                //                 .doc(key)
                //                 .create(HabitCompletion(
                //                   habitId: habit.id,
                //                   timestamp: DateTime.now(),
                //                 ));
                //           }
                //         },
                //         child: Container(
                //           width: 40,
                //           height: 40,
                //           decoration: BoxDecoration(
                //             color: habit.color.foregroundByLuminance,
                //             borderRadius: BorderRadius.circular(4),
                //           ),
                //           child: isCompleted
                //               ? Icon(
                //                   Icons.check_outlined,
                //                   size: 32,
                //                   color: habit.color,
                //                 )
                //               : const SizedBox(),
                //         ),
                //       );
                //     }),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddHabitScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
