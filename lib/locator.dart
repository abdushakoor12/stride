import 'package:stride/data/database/app_database.dart';

import 'data/habit_repo.dart';

final locator = ServiceLocator()
  ..add(AppDatabase())
  ..add(HabitRepo());

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();

  ServiceLocator._internal();

  factory ServiceLocator() {
    return _instance;
  }

  final Map<Type, dynamic> _services = {};

  void add<T>(T service) {
    _services[T] = service;
  }

  T get<T>() {
    if (_services.containsKey(T)) {
      return _services[T] as T;
    }

    throw Exception('Service $T not found');
  }

  void clear() {
    _services.clear();
  }
}
