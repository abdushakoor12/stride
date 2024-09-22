import 'package:intl/intl.dart';

class HabitCompletion {
  final String habitId;
  final DateTime timestamp;

  HabitCompletion({
    required this.habitId,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'habitId': habitId,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory HabitCompletion.fromJson(Map<String, dynamic> json) {
    return HabitCompletion(
      habitId: json['habitId'] as String,
      timestamp: DateTime.fromMillisecondsSinceEpoch(json['timestamp'] as int),
    );
  }

  String get key => getCompletionKey(habitId, timestamp);
  String get dateKey => getDateKey(timestamp);

  static String getCompletionKey(String habitId, DateTime dateTime) {
    return '$habitId-${getDateKey(dateTime)}';
  }

  static String getDateKey(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  Map<String, dynamic> toMap() {
    return {
      'habitId': habitId,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory HabitCompletion.fromMap(Map<String, dynamic> map) {
    return HabitCompletion(
      habitId: map['habitId'] as String,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
    );
  }
}
