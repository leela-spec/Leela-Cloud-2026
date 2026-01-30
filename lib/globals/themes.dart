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
    primary: Color(0xffd51ec4),
    surface: Color(0xff100210),
    secondary: Color(0xff970979),
  ),
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
