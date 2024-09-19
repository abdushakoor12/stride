import 'package:flutter/foundation.dart';
import 'package:loon/loon.dart';

final di = _DIContainer();

class _DIContainer {
  // all app dependencies that require future initialization
  // should be initialized here
  Future<void> init() async {
    // loon peristence
    Loon.configure(persistor: FilePersistor(), enableLogging: kDebugMode);
    await Loon.hydrate();
  }
}
