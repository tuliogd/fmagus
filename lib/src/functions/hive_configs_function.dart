import 'dart:io';

/// Function to create Route Generator
void hiveConfigs() {
  print(_start);

  _createHiveConfigs();

  print(_end);
}

//? PRIVATE
//+ GETTERS
String get _start => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                        Starting Creating HiveConfigs...                    ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

String get _end => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                HiveConfigs Creating completed successfully!                ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

String get _hiveConfigs => '''
import 'package:hive_flutter/hive_flutter.dart';

class HiveConfigs {
  //! ---------------------------------------->> CONSTANTS <<---------------------------------------- //

  //+ SETTINGS BOX
  static const String settingsBoxName = 'settings';
  static const String settingsAppThemeKey = 'appTheme';

  //! ---------------------------------------->> METHODS <<---------------------------------------- //

  //+ INIT
  static Future<void> initHive() async {
    await Hive.initFlutter();
  }
}
''';

//+ FUNCTIONS
void _createHiveConfigs() {
  print('\n\nCreating HiveConfigs...\n');
  File('lib/hive_configs.dart').writeAsStringSync(
    _hiveConfigs,
    mode: FileMode.writeOnly,
  );
  print('Creating Completed.');
}
