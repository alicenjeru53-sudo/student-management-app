import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.teal,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
    );
  }
}
