import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade100,
    inversePrimary: const Color(0xba252625),
    surfaceDim: const Color(0xc3bb86fc),
    primaryFixedDim: Color(0xb0d8d7d7),
    inverseSurface: Color(0x441e1e1e),
    tertiary: Color(0x96000000),


  ),
);

//Dark Mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.black54,
    primary: const Color(0xf71e1e1e),
    secondary: Colors.grey.shade700,
    inversePrimary: Colors.grey.shade300,
    surfaceContainerLow: Colors.black45,
    surfaceDim: const Color(0xc3cf6679),
    primaryFixedDim: Color(0xc21e1e1e),
    inverseSurface: Color(0x44EAEAEA),
    tertiary: Color(0x96000000),

  ),
);