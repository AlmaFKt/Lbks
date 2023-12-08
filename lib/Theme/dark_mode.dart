import 'package:flutter/material.dart';

ThemeData DarkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Color.fromARGB(255, 117, 100, 114),        
        primary: const Color.fromARGB(255, 238, 232, 232),
        secondary: Color.fromARGB(255, 207, 206, 206),
        inversePrimary: Color.fromARGB(255, 231, 191, 191)
        ),
    textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Color.fromARGB(255, 233, 228, 228),
          displayColor: Colors.white,
        ));