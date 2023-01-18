import 'dart:io';

import 'package:process_run/shell_run.dart';

/// Function to build the App.
///
/// Parameters:
/// - [String] target: The target to build (android, ios, web etc).
/// - [String] type: The type of build (apk, appbundle, ipa etc).
/// - [String] obfuscate: Obfuscate or not the App code (true or false).
Future<void> buildApp({
  required String target,
  required String type,
  String? obfuscate,
}) async {
  String obfuscateString =
      obfuscate == 'true' ? '--obfuscate --split-debug-info=debug' : '';

  String end = '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                        Build completed successfully!                       ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

  switch (target) {
    case 'android':
      {
        String tipo;

        switch (type) {
          case 'apk':
            tipo = 'APK';
            break;
          case 'appbundle':
            tipo = 'AppBundle';
            break;
          default:
            {
              tipo = 'AppBundle';
              type = 'appbundle';

              print('Type not identified. Using default: $tipo');
            }
            break;
        }

        String start = '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                       Starting android App Building...                     ║
╚════════════════════════════════════════════════════════════════════════════╝

Obfuscate: $obfuscate
Type: $tipo
''';

        print(start);

        print('\n\nClearing Flutter\'s cache...');
        Shell shell = Shell();
        await shell.run('flutter clean');
        print('\nCleaning completed.\n\n');

        print('Downloading plugins and packages...');
        await shell.run('flutter pub get');
        print('Download of plugins and packages completed.\n\n');

        print('Start building...');
        await shell.run('flutter build $type $obfuscateString --release');
        print('\nBuilding completed.');

        print(end);

        exit(0);
      }
    case 'ios':
      {
        String start = '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                         Starting iOS App Building..                        ║
╚════════════════════════════════════════════════════════════════════════════╝

Obfuscate: $obfuscate
Type: iOS Package App Store (IPA)
''';

        print(start);

        print('\n\nClearing Flutter\'s cache...');
        Shell shell = Shell();
        await shell.run('flutter clean');
        print('\nCleaning completed.\n\n');

        print('Downloading plugins and packages...');
        await shell.run('flutter pub get');
        print('\nDownload of plugins and packages completed.\n\n');

        print('Start building...');

        await shell.run('flutter build ipa $obfuscateString --release');
        print('\nBuilding completed.');

        print(end);

        exit(0);
      }
    case 'web':
      {
        String tipo;

        switch (type) {
          case 'canvaskit':
            tipo = 'CanvasKit';
            break;
          case 'html':
            tipo = 'HTML';
            break;
          case 'appbundle':
            {
              tipo = 'CanvasKit';
              type = 'canvaskit';
            }
            break;
          default:
            {
              tipo = 'CanvasKit';
              type = 'canvaskit';

              print('Type not identified. Using default: $tipo');
            }
            break;
        }

        String start = '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                         Starting Web App Building...                       ║
╚════════════════════════════════════════════════════════════════════════════╝

Type: $tipo
''';

        print(start);

        print('\n\nClearing Flutter\'s cache...');
        Shell shell = Shell();
        await shell.run('flutter clean');
        print('\nCleaning completed.\n\n');

        print('Downloading plugins and packages...');
        await shell.run('flutter pub get');
        print('Download of plugins and packages completed.\n\n');

        print('Start building...');
        await shell.run('flutter build web --web-renderer $type --release');
        print('\nBuilding completed.');

        print(end);

        exit(0);
      }
    case 'macos':
      {
        String start = '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                        Starting macOS App Building...                      ║
╚════════════════════════════════════════════════════════════════════════════╝

Obfuscate: $obfuscate
''';

        print(start);

        print('\n\nClearing Flutter\'s cache...');
        Shell shell = Shell();
        await shell.run('flutter clean');
        print('\nCleaning completed.\n\n');

        print('Downloading plugins and packages...');
        await shell.run('flutter pub get');
        print('Download of plugins and packages completed.\n\n');

        print('Start building...');
        await shell.run('flutter build macos $obfuscateString --release');
        print('\nBuilding completed.');

        print(end);

        exit(0);
      }
    case 'windows':
      {
        String start = '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                        Starting Windows App Building...                    ║
╚════════════════════════════════════════════════════════════════════════════╝

''';

        print(start);

        print('\n\nClearing Flutter\'s cache...');
        Shell shell = Shell();
        await shell.run('flutter clean');
        print('\nCleaning completed.\n\n');

        print('Downloading plugins and packages...');
        await shell.run('flutter pub get');
        print('Download of plugins and packages completed.\n\n');

        print('Start building...');
        await shell.run('flutter build windows --release');
        print('\nBuilding completed.');

        print(end);

        exit(0);
      }
    case 'linux':
      {
        String start = '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                         Starting Linux App Building...                     ║
╚════════════════════════════════════════════════════════════════════════════╝

''';

        print(start);

        print('\n\nClearing Flutter\'s cache...');
        Shell shell = Shell();
        await shell.run('flutter clean');
        print('\nCleaning completed.\n\n');

        print('Downloading plugins and packages...');
        await shell.run('flutter pub get');
        print('Download of plugins and packages completed.\n\n');

        print('Start building...');
        await shell.run('flutter build linux --release');
        print('\nBuilding completed.');

        print(end);

        exit(0);
      }
    default:
      {
        print('\nInvalid target.');
        exit(2);
      }
  }
}
