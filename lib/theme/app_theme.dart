import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(204, 173, 32, 32);
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: const Color.fromARGB(255, 109, 40, 35),
      secondaryHeaderColor: const Color.fromARGB(255, 109, 40, 35),
      appBarTheme: const AppBarTheme(color: primary, elevation: 0));
}

const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 109, 40, 35),
    onPrimary: Color.fromARGB(255, 243, 218, 218),
    secondary: Color.fromARGB(255, 230, 122, 114),
    onSecondary: Color.fromARGB(255, 243, 218, 218),
    error: Color.fromARGB(255, 237, 237, 77),
    onError: Color.fromARGB(255, 250, 243, 243),
    // background: Color(0xFFFCFDF6),
    // onBackground: Color(0xFF1A1C18),
    surface: Color(0xFFF9FAF3),
    onSurface: Color(0xFF1A1C18));

const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromARGB(255, 109, 40, 35),
    onPrimary: Color.fromARGB(255, 243, 218, 218),
    secondary: Color.fromARGB(255, 230, 122, 114),
    onSecondary: Color.fromARGB(255, 243, 218, 218),
    error: Color.fromARGB(255, 251, 248, 115),
    onError: Color.fromARGB(255, 250, 243, 243),
    // background: Color(0xFFFCFDF6),
    // onBackground: Color(0xFF1A1C18),
    surface: Color(0xFFF9FAF3),
    onSurface: Color(0xFF1A1C18));

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(
        const Color.fromARGB(
            255, 179, 100, 95), // Slightly darker shade for the button
      ),
      foregroundColor:
          WidgetStateProperty.all<Color>(Colors.white), // text color
      elevation: WidgetStateProperty.all<double>(5.0), // shadow
      padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 18)),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Adjust as needed
        ),
      ),
    ),
  ),
);

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: darkColorScheme,
);
