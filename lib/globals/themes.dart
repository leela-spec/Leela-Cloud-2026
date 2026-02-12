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
    surface: Color(0xFF100030),
    primary: Color(0xFFF010C0),
    secondary: Color(0xFFB030D0),
    tertiary: Color(0xFF4060F0),
    onSurface: Color(0xFFFFFFFF),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
  ),
  scaffoldBackgroundColor: const Color(0xFF000020),
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
