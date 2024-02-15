import 'package:flutter/material.dart';

var defaultBackgroundColor = Colors.grey[300];
// var appBarColor = Colors.grey[900];

var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
Color active = const Color(0xFF3C19C0);

class PrimarySwatchDark extends MaterialColor {
  PrimarySwatchDark(int primary)
      : super(
          primary,
          <int, Color>{
            50: const Color.fromRGBO(40, 44, 62, 0.1),
            100: const Color.fromRGBO(40, 44, 62, 0.2),
            200: const Color.fromRGBO(40, 44, 62, 0.3),
            300: const Color.fromRGBO(40, 44, 62, 0.4),
            400: const Color.fromRGBO(40, 44, 62, 0.5),
            500: Color(primary),
            600: const Color.fromRGBO(40, 44, 62, 0.7),
            700: const Color.fromRGBO(40, 44, 62, 0.8),
            800: const Color.fromRGBO(40, 44, 62, 0.9),
            900: const Color.fromRGBO(40, 44, 62, 1),
          },
        );
}

class PrimarySwatchLight extends MaterialColor {
  PrimarySwatchLight(int primary)
      : super(
          primary,
          <int, Color>{
            50: const Color.fromRGBO(255, 255, 255, 0.1),
            100: const Color.fromRGBO(255, 255, 255, 0.2),
            200: const Color.fromRGBO(255, 255, 255, 0.3),
            300: const Color.fromRGBO(255, 255, 255, 0.4),
            400: const Color.fromRGBO(255, 255, 255, 0.5),
            500: Color(primary),
            600: const Color.fromRGBO(255, 255, 255, 0.7),
            700: const Color.fromRGBO(255, 255, 255, 0.8),
            800: const Color.fromRGBO(255, 255, 255, 0.9),
            900: const Color.fromRGBO(255, 255, 255, 1),
          },
        );
}

ColorScheme colorSchemeDark = const ColorScheme.dark();
ColorScheme colorSchemeLight = const ColorScheme.light();
