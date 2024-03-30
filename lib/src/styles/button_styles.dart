import 'package:flutter/material.dart';

class AppButtonStyles {
  static ButtonStyle elevatedButtonStyle(Color bgColor, Color txtColor) {
    return ElevatedButton.styleFrom(
      backgroundColor: bgColor,
      foregroundColor: txtColor,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      textStyle: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}
class NormalButtonStyles {
  static ButtonStyle elevatedButtonStyle(Color bgColor, Color txtColor) {
    return ElevatedButton.styleFrom(
      backgroundColor: bgColor,
      foregroundColor: txtColor,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }
}
