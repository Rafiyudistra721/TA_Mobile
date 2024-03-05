import 'package:flutter/material.dart';

var defaultBackgroundColor = Colors.grey[300];
// var appBarColor = Colors.grey[900];

var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
Color active = const Color(0xFF3C19C0);

  const Color darkerAppBarColor = Color(0xFF003D38); 
  const Color lighterAppBarColor = Color(0xFFB9C4C9); 
  const Color darkerDrawerBackgroundColor = Color(0xFF003D38); 
  const Color lighterDrawerBackgroundColor = Color(0xFFEDF8F6); 
  const Color darkerScaffoldBackgroundColor = Color(0xFF181A1B); 
  const Color lighterScaffoldBackgroundColor = Color(0xFFEEF5F4); 
  const Color darkerListTileSelectedColor = Color(0xFF006B62); 
  const Color lighterListTileSelectedColor = Color(0xFF8AC9BE); 
  const Color darkerListTileSelectedTileColor = Color(0xFF8AC9BE); 
  const Color lighterListTileSelectedTileColor = Color(0xFF006B62); 
  const Color darkerDataTableHeadingRowColor = Color(0xFF003D38); 
  const Color darkerDataTableDataRowColor = Color(0xFF121415); 
  const Color lighterDataTableHeadingRowColor = Color(0xFF004D47); 
  const Color lighterDataTableDataRowColor = Color(0xFFEEF5F4); 

const darkColorScheme = ColorScheme.dark(
  primary: Color(0xFF004D47), // Forest green as primary
  secondary: Color(0xFFB9C4C9), // Muted mustard yellow 
  onSecondary: Colors.black,  // Black on secondary for contrast

  surface: Color(0xFF003530), // Slightly darker shade of green for surface
  onSurface: Colors.white,

  tertiary: Color(0xFF08423C), 
  tertiaryContainer: Color(0xFF00302D), 

  onPrimary: Colors.white,  // Ensure high contrast on the primary color
  background: Color(0xFF181A1B), // Slightly lighter background for distinction
  onBackground: Colors.white, // Maintain strong contrast on the background

  error: Colors.red, 
  onError: Colors.white,  // Clear visibility of errors
);


const lightColorScheme = ColorScheme.light(
  primary: Color(0xFF006B62), // Slightly brighter green 
  secondary: Color(0xFFB9C4C9), // Muted mustard yellow 
  onSecondary: Colors.black,
  
  surface: Color(0xFFEEF5F4),  // Soft cream
  onSurface: Colors.black,

  // New Colors Adjusted for Accessibility
  tertiary: Color(0xFFD5E8E6), 
  tertiaryContainer: Color(0xFF79A09C),

  onPrimary: Colors.black, // Ensure sufficient contrast 
  background: Colors.white, // Classic light mode background
  onBackground: Colors.black, // Strong text contrast

  error: Colors.red, 
  onError: Colors.white,
);



