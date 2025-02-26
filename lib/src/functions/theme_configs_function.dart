import 'dart:io';

/// Function to create Route Generator
void themeConfigs() {
  print(_start);

  _createThemeConfigs();

  print(_end);
}

//? PRIVATE
//+ GETTERS
String get _start => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                       Starting Creating ThemeConfigs...                    ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

String get _end => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║               ThemeConfigs Creating completed successfully!                ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

String get _themeConfigs => '''
import 'package:flutter/material.dart';

class ThemeConfigs {
  //! ---------------------------------------->> CONSTANTS <<---------------------------------------- //
  static const lightThemeName = 'light';
  static const darkThemeName = 'dark';

  //! ---------------------------------------->> THEMES <<---------------------------------------- //
  final ThemeData lightMaterialTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.yourColorHere,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      errorMaxLines: 999,
      helperMaxLines: 999,
    ),
  );

  final ThemeData darkMaterialTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.yourColorHere,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      errorMaxLines: 999,
      helperMaxLines: 999,
    ),
  );
}
''';

//+ FUNCTIONS
void _createThemeConfigs() {
  print('\n\nCreating ThemeConfigs...\n');
  Directory('lib/src/configs').createSync(recursive: true);
  File(
    'lib/src/configs/theme_configs.dart',
  ).writeAsStringSync(_themeConfigs, mode: FileMode.writeOnly);
  print('Creating Completed.');
}
