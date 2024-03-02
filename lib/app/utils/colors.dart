import 'package:flutter/material.dart';

var defaultBackgroundColor = Colors.grey[300];
// var appBarColor = Colors.grey[900];

var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
Color active = const Color(0xFF3C19C0);

class PrimarySwatch extends MaterialColor {
  PrimarySwatch(int primary)
      : super(
          primary,
          <int, Color>{
            50: const Color.fromRGBO(0, 77, 71, 0.1),
            100: const Color.fromRGBO(0, 77, 71, 0.2),
            200: const Color.fromRGBO(0, 77, 71, 0.3),
            300: const Color.fromRGBO(0, 77, 71, 0.4),
            400: const Color.fromRGBO(0, 77, 71, 0.5),
            500: const Color.fromRGBO(0, 77, 71, 0.6),
            600: const Color.fromRGBO(0, 77, 71, 0.7),
            700: const Color.fromRGBO(0, 77, 71, 0.8),
            800: const Color.fromRGBO(0, 77, 71, 0.9),
            900: Color(primary),
          },
        );
}

class SecondarySwatch extends MaterialColor {
  SecondarySwatch(int secondary)
      : super(
          secondary,
          <int, Color>{
            50: const Color.fromRGBO(18, 130, 119, 0.1),
            100: const Color.fromRGBO(18, 130, 119, 0.2),
            200: const Color.fromRGBO(18, 130, 119, 0.3),
            300: const Color.fromRGBO(18, 130, 119, 0.4),
            400: const Color.fromRGBO(18, 130, 119, 0.5),
            500: const Color.fromRGBO(18, 130, 119, 0.6),
            600: const Color.fromRGBO(18, 130, 119, 0.7),
            700: const Color.fromRGBO(18, 130, 119, 0.8),
            800: const Color.fromRGBO(18, 130, 119, 0.9),
            900: Color(secondary),
          },
        );
}
class TertiarySwatch extends MaterialColor {
  TertiarySwatch(int tertiary)
      : super(
          tertiary,
          <int, Color>{
            50: const Color.fromRGBO(82, 149, 139, 0.1),
            100: const Color.fromRGBO(82, 149, 139, 0.2),
            200: const Color.fromRGBO(82, 149, 139, 0.3),
            300: const Color.fromRGBO(82, 149, 139, 0.4),
            400: const Color.fromRGBO(82, 149, 139, 0.5),
            500: const Color.fromRGBO(82, 149, 139, 0.6),
            600: const Color.fromRGBO(82, 149, 139, 0.7),
            700: const Color.fromRGBO(82, 149, 139, 0.8),
            800: const Color.fromRGBO(82, 149, 139, 0.9),
            900: Color(tertiary),
          },
        );
}

ColorScheme colorSchemeDark = ColorScheme.dark(
  primary: PrimarySwatch(0xff004D47),
  // Color(0xff004D47),
  secondary: SecondarySwatch(0xff128277),
  // Color(0xff128277),
  tertiary: TertiarySwatch(0xff52958B),
  // Color(0xff52958B),
  surface: Color(0xffB9C4C9)
);
ColorScheme colorSchemeLight = ColorScheme.light(
  primary: PrimarySwatch(0xff004D47),
  // Color(0xff004D47),
  secondary: SecondarySwatch(0xff128277),
  // Color(0xff128277),
  tertiary: TertiarySwatch(0xff52958B),
  // Color(0xff52958B),
  surface: Color(0xffB9C4C9)
);
