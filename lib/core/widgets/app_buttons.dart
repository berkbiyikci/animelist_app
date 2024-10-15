import 'package:flutter/material.dart';

class AppButtons {
  const AppButtons._();

  static ButtonStyleButton primary({
    required VoidCallback onPressed,
    required Widget child,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(),
      child: child,
    );
  }

  static ButtonStyleButton withColor({
    required VoidCallback onPressed,
    required Widget child,
    required Color color,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(),
      child: child,
    );
  }

  static ButtonStyleButton outlined({
    required VoidCallback onPressed,
    required Widget child,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(),
      child: child,
    );
  }
}
