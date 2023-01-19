import 'dart:io';

/// Function to exhibit the table of commands
void help() {
  print(_commandTable);

  exit(0);
}

//? PRIVATE
//+ GETTERS
String get _commandTable => '''

╔════════════════════════════════════════════════════════════════════════════╗
║                                 🧙 FMAGUS 🧙                               ║
╠════════════════════════════════════════════════════════════════════════════╣
║            fmagus:build             ║                                      ║
║         --target=platform           ║     Builds the App to the selected   ║
║           --type=output             ║     target.                          ║
║      --obfuscate=true or false      ║                                      ║
║  --debugInfo=debug/info/directory   ║                                      ║
╠════════════════════════════════════════════════════════════════════════════╣
║                                     ║     Cleans the Flutter cache and     ║
║             fmagus:clean            ║     download the packages and        ║
║                                     ║     plugins again.                   ║
╠════════════════════════════════════════════════════════════════════════════╣
║    fmagus:generate_image_asset      ║     Creates an Image Asset of        ║
║    --path=path/to/resource.png      ║     all sized from a given           ║
║    --assetName=asset_name           ║     image (only png).                ║
╠════════════════════════════════════════════════════════════════════════════╣
║            fmagus:mobx              ║     Imports all the MobX Packages    ║
║                                     ║     necessary to Flutter.            ║
╠════════════════════════════════════════════════════════════════════════════╣
║            fmagus:hive              ║     Imports all the Hive Packages    ║
║    --generator=true or false        ║     necessary to Flutter.            ║
╠════════════════════════════════════════════════════════════════════════════╣
║          fmagus:firebase            ║     Imports Firebase basic packages. ║
╠════════════════════════════════════════════════════════════════════════════╣
║             fmagus:mvc              ║     Creates MVC Directory Structure. ║
╠════════════════════════════════════════════════════════════════════════════╣
║        fmagus:provider_scope        ║     Generates a Custom MultiProvider ║
║                                     ║     Widget.                          ║
╠════════════════════════════════════════════════════════════════════════════╣
║        fmagus:create_routegen       ║     Creates a RouteGenerator file.   ║
╠════════════════════════════════════════════════════════════════════════════╣
║         fmagus:theme_configs        ║     Creates a ThemeConfigs file.     ║
╠════════════════════════════════════════════════════════════════════════════╣
║    fmagus:hive_settings_repository  ║     Creates a SettingsRepository     ║
║                                     ║     with Hive.                       ║
╚════════════════════════════════════════════════════════════════════════════╝

''';
