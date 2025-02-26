import 'dart:io';

/// Function to create Route Generator
void hiveSettingsRepository() {
  print(_start);

  _createSettingsRepository();

  print(_end);
}

//? PRIVATE
//+ GETTERS
String get _start => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                 Starting Creating HiveSettingsRepository...                ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

String get _end => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║           HiveSettingsRepository Creating completed successfully!          ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

String get _settingsRepositoryInterface => '''
abstract class ISettingsRepository {
  //+ AppTheme
  Future<String> getAppTheme();
  Future<void> setAppTheme(
    String value,
  );
}
''';

String get _settingsRepository => '''
import 'package:hive/hive.dart';

import 'interfaces/settings_repository_interface.dart';

class SettingsRepository implements ISettingsRepository {
  @override
  Future<void> setAppTheme(
    String value,
  ) async {
    Box box = await Hive.openBox(yourSettingsBoxName);

    await box.put(yourThemeKey, value);

    await box.close();
  }

  @override
  Future<String> getAppTheme() async {
    Box box = await Hive.openBox(yourSettingsBoxName);

    String theme = box.get(
      yourThemeKey,
      defaultValue: yourLightThemeName,
    );

    await box.close();

    return theme;
  }
}
''';

//+ FUNCTIONS
void _createSettingsRepository() {
  print('\n\nCreating ThemeConfigs...\n');
  Directory('lib/src/repositories/interfaces').createSync(recursive: true);
  File(
    'lib/src/repositories/interfaces/settings_repository_interface.dart',
  ).writeAsStringSync(_settingsRepositoryInterface, mode: FileMode.writeOnly);
  File(
    'lib/src/repositories/settings_repository.dart',
  ).writeAsStringSync(_settingsRepository, mode: FileMode.writeOnly);
  print('Creating Completed.');
}
