import 'package:flutter/material.dart';
import 'package:ta_mobile/app/utils/colors.dart';

class ThemeModel {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: PrimarySwatchLight(0xffffffff),
    primaryColor: const Color(0xffffffff),
    colorScheme: colorSchemeLight,
    useMaterial3: true,
  );
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: PrimarySwatchDark(0xff282C3E),
    primaryColor: const Color(0xff212232),
    useMaterial3: true,
    // colorScheme: colorSchemeDark
    );
}
