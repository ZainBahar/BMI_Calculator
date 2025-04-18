import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
    ),
    switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all<Color>(Colors.tealAccent)),
    scaffoldBackgroundColor: Colors.white,
    sliderTheme: SliderThemeData(
      activeTrackColor: Colors.tealAccent,
      thumbColor: Colors.tealAccent,
    ));

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      // const Color.fromARGB(255, 2, 6, 27)
      backgroundColor: Colors.pink,
      foregroundColor: Colors.white,
    ),
    switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all<Color>(Colors.pink)),
    scaffoldBackgroundColor: const Color.fromARGB(235, 2, 9, 39),
    sliderTheme: SliderThemeData(
      activeTrackColor: Colors.pink,
      thumbColor: Colors.pink,
    ));
