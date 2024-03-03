import 'package:flutter/material.dart';
import 'package:ta_mobile/app/utils/colors.dart';

class ThemeModel {
  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      drawerTheme: const DrawerThemeData(
          shape: BeveledRectangleBorder(),
          backgroundColor: lighterDrawerBackgroundColor),
      colorScheme: lightColorScheme,
      appBarTheme: const AppBarTheme(backgroundColor: lighterAppBarColor),
      scaffoldBackgroundColor: lighterScaffoldBackgroundColor,
      useMaterial3: true,
      listTileTheme: const ListTileThemeData(
          selectedColor: lighterListTileSelectedColor,
          selectedTileColor: lighterListTileSelectedTileColor),
      dataTableTheme: const DataTableThemeData(
        headingRowColor:
            MaterialStatePropertyAll(lighterDataTableHeadingRowColor),
        dataRowColor: MaterialStatePropertyAll(lighterDataTableDataRowColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF006B62),
        foregroundColor: Colors.white,
        disabledBackgroundColor: const Color(0xFF8AC9BE),
      )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFB9C4C9),
        foregroundColor: Colors.black,
      ),
      fontFamily: 'Urbanist');

  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      drawerTheme: const DrawerThemeData(
          shape: BeveledRectangleBorder(),
          backgroundColor: darkerDrawerBackgroundColor),
      colorScheme: darkColorScheme,
      appBarTheme: const AppBarTheme(backgroundColor: darkerAppBarColor),
      scaffoldBackgroundColor: darkerScaffoldBackgroundColor,
      useMaterial3: true,
      listTileTheme: const ListTileThemeData(
          selectedColor: darkerListTileSelectedColor,
          selectedTileColor: darkerListTileSelectedTileColor),
      dataTableTheme: const DataTableThemeData(
        headingRowColor:
            MaterialStatePropertyAll(darkerDataTableHeadingRowColor),
        dataRowColor: MaterialStatePropertyAll(darkerDataTableDataRowColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF004D47),
          foregroundColor: Colors.white,
          disabledBackgroundColor: const Color(0xFF181A1B)
              .withOpacity(0.6),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF006B62),
        foregroundColor: Colors.white,
      ),
      fontFamily: 'Urbanist');
}
