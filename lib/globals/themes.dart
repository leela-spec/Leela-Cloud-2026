import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(),
  textTheme: const TextTheme(),
);

@NowaGenerated()
final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFD51EC4),
    secondary: Color(0xFF8E1483),
    surface: Color(0xFF21002D),
    error: Color(0xFFB3114D),
    onSurface: Color(0xFFFFFFFF),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
  ),
  scaffoldBackgroundColor: const Color(0xFF0B0627),
  textTheme: const TextTheme(),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color?>(null),
      foregroundColor: WidgetStatePropertyAll<Color?>(null),
      shadowColor: WidgetStatePropertyAll<Color?>(null),
      elevation: WidgetStatePropertyAll<double?>(null),
      side: WidgetStatePropertyAll<BorderSide?>(null),
      shape: WidgetStatePropertyAll<RoundedRectangleBorder?>(null),
    ),
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color?>(null),
      foregroundColor: WidgetStatePropertyAll<Color?>(null),
      shadowColor: WidgetStatePropertyAll<Color?>(null),
      elevation: WidgetStatePropertyAll<double?>(null),
      side: WidgetStatePropertyAll<BorderSide?>(null),
      shape: WidgetStatePropertyAll<RoundedRectangleBorder?>(null),
    ),
  ),
);
