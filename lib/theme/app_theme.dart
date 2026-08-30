import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFFFAF7F2),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF4A1525),
    primary: const Color(0xFF4A1525),
    secondary: const Color(0xFFD8A7B1),
    tertiary: const Color(0xFFD4AF37),
    surface: const Color(0xFFFAF7F2),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF4A1525),
    foregroundColor: Color(0xFFFAF7F2),
    centerTitle: true,
  ),
);
