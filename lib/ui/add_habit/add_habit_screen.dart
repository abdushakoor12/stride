import 'package:flutter/material.dart';
import 'package:stride/data/habit.dart';
import 'package:stride/di.dart';
import 'package:stride/utils/color_ext.dart';
import 'package:stride/utils/generate_id.dart';

class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({super.key});

  @override
  State<AddHabitScreen> createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final _nameController = TextEditingController();
  Color color = Colors.primaries.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Habit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final color in Colors.primaries)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        this.color = color;
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: color == this.color
                          ? Icon(
                              Icons.check,
                              color: color.foregroundByLuminance,
                            )
                          : const SizedBox(),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: () {
                final name = _nameController.text.trim();
                if (name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Name cannot be empty'),
                    ),
                  );
                  return;
                }

                di.habitRepo.insertHabit(Habit(
                  name: name,
                  color: color,
                  timestamp: DateTime.now(), id: generateId(),
                ));

                Navigator.pop(context);
              },
              label: const Text('Save'),
              icon: const Icon(Icons.save),
            ),
          ],
        ),
      ),
    );
  }
}
