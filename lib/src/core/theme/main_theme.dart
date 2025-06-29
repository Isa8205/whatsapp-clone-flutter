import 'package:flutter/material.dart';

final ThemeData whatsappDarkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: const Color(0xFF121B22), // Main background
  primaryColor: const Color(0xFF00A884), // Accent color (buttons, FAB)
  hintColor: Colors.grey[500], // Placeholder text

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1F2C34),
    foregroundColor: Colors.white,
    elevation: 0,
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF00A884),
    foregroundColor: Colors.white,
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
    titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),

  iconTheme: const IconThemeData(
    color: Colors.white70,
  ),

  cardColor: const Color(0xFF1E2A32), // Chat tiles, input bars
  dividerColor: Colors.white12, // Thin line between chats/messages

  inputDecorationTheme: const InputDecorationTheme(
    fillColor: Color(0xFF202C33),
    filled: true,
    hintStyle: TextStyle(color: Colors.white60),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  ),
);
