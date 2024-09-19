import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color get foregroundByLuminance {
    return computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
}
