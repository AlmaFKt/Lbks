import 'package:flutter/material.dart';

ThemeData LigthMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Color.fromARGB(255, 252, 248, 249),
        primary: Color.fromARGB(255, 14, 13, 13),
        secondary: Color.fromARGB(255, 12, 12, 12),
        inversePrimary: Color.fromARGB(255, 243, 213, 213)),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Color.fromARGB(255, 14, 13, 13),
          displayColor: Color.fromARGB(255, 8, 8, 8),
        ));