import 'dart:ui';

class Habit {
  final String id;
  final String name;
  final Color color;
  final DateTime timestamp;

  Habit({
    required this.id,
    required this.name,
    required this.color,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color.value,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      id: json['id'] as String,
      name: json['name'] as String,
      color: Color(json['color'] as int),
      timestamp: DateTime.fromMillisecondsSinceEpoch(json['timestamp'] as int),
    );
  }
}
