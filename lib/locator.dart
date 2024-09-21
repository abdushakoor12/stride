import 'package:flutter/material.dart';
import 'package:stride/data/database/app_database.dart';

import 'data/habit_repo.dart';

final locator = ServiceLocator()
  ..addLazy<AppDatabase>(() => AppDatabase())
  ..add(HabitRepo());

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();

  ServiceLocator._internal();

  factory ServiceLocator() {
    return _instance;
  }

  final Map<Type, dynamic> _services = {};
  final Map<Type, Function> _lazyInitializers = {};

  @visibleForTesting
  Map<Type, dynamic> get services => _services;

  @visibleForTesting
  Map<Type, Function> get lazyInitializers => _lazyInitializers;

  void add<T>(T service) {
    _services[T] = service;
  }

  void addLazy<T>(Function() lazyService) {
    _lazyInitializers[T] = lazyService;
  }

  T get<T>() {
    if (_services.containsKey(T)) {
      return _services[T] as T;
    } else if (_lazyInitializers.containsKey(T)) {
      final lazyService = _lazyInitializers[T] as Function;
      _services[T] = lazyService();
      _lazyInitializers.remove(T);
      return _services[T] as T;
    }

    throw Exception('Service $T not found');
  }

  void override<T>(T service) {
    _services[T] = service;
  }

  void overrideLazily<T>(Function() lazyService) {
    if(_services.containsKey(T)) {
      _services.remove(T);
    }

    _lazyInitializers[T] = lazyService;
  }

  void clear() {
    _services.clear();
    _lazyInitializers.clear();
  }
}
