import 'dart:io';

import 'package:process_run/shell_run.dart';

/// Function to build the App.
///
/// Parameters:
/// - [String] target: The target to build (android, ios, web etc).
/// - [String] configFile: The config file to use (configs.json etc).
/// - [String] type: The type of build (apk, appbundle, ipa etc).
/// - [String] obfuscate: Obfuscate the App code (true or false).
/// - [String] debugInfo: Directory to save the debug info.
Future<void> buildApp({
  required String target,
  required String configFile,
  required String type,
  required String obfuscate,
  required String debugInfo,
}) async {
  final String obfuscateString = _obfuscateString(obfuscate, debugInfo);
  final Shell shell = Shell();
  late final String tipo;

  switch (target) {
    case 'android':
      {
        tipo = _identifyType(target, type);
        type = tipo.toLowerCase();

        print(_startAndroidString(obfuscate, tipo));

        await _flutterClean(shell);
        await _flutterPubGet(shell);
        await _flutterBuild(
            shell, configFile, '$type $obfuscateString --release');

        print(_end);

        exit(0);
      }
    case 'ios':
      {
        print(_startIOSString(obfuscate));

        await _flutterClean(shell);
        await _flutterPubGet(shell);
        await _flutterBuild(
            shell, configFile, 'ipa $obfuscateString --release');

        print(_end);

        exit(0);
      }
    case 'web':
      {
        String tipo = _identifyType(target, type);
        type = tipo.toLowerCase();

        print(_startWebString(tipo));

        await _flutterClean(shell);
        await _flutterPubGet(shell);
        await _flutterBuild(
          shell,
          configFile,
          'web --web-renderer $type --release',
        );

        print(_end);

        exit(0);
      }
    case 'macos':
      {
        print(_startMacOSString(obfuscate));

        await _flutterClean(shell);
        await _flutterPubGet(shell);
        await _flutterBuild(
            shell, configFile, 'macos $obfuscateString --release');

        print(_end);

        exit(0);
      }
    case 'windows':
      {
        print(_startWindowsString);

        await _flutterClean(shell);
        await _flutterPubGet(shell);
        await _flutterBuild(shell, configFile, 'windows --release');

        print(_end);

        exit(0);
      }
    case 'linux':
      {
        print(_startLinuxString);

        await _flutterClean(shell);
        await _flutterPubGet(shell);
        await _flutterBuild(shell, configFile, 'linux --release');

        print(_end);

        exit(0);
      }
    default:
      {
        print('\nInvalid target.');
        exit(2);
      }
  }
}

//? PRIVATE
//+ GETTERS
String get _end => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                        Build completed successfully!                       ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

String get _startWindowsString => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                        Starting Windows App Building...                    ║
╚════════════════════════════════════════════════════════════════════════════╝

''';

String get _startLinuxString => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                         Starting Linux App Building...                     ║
╚════════════════════════════════════════════════════════════════════════════╝

''';

//+ FUNCTIONS
String _startAndroidString(String obfuscate, String tipo) => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                       Starting android App Building...                     ║
╚════════════════════════════════════════════════════════════════════════════╝

Obfuscate: $obfuscate
Type: $tipo
''';

String _startIOSString(String obfuscate) => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                         Starting iOS App Building..                        ║
╚════════════════════════════════════════════════════════════════════════════╝

Obfuscate: $obfuscate
Type: iOS Package App Store (IPA)
''';

String _startWebString(String tipo) => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                         Starting Web App Building...                       ║
╚════════════════════════════════════════════════════════════════════════════╝

Type: $tipo
''';

String _startMacOSString(String obfuscate) => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                        Starting macOS App Building...                      ║
╚════════════════════════════════════════════════════════════════════════════╝

Obfuscate: $obfuscate
''';

String _obfuscateString(String obfuscate, String debugInfo) {
  switch (obfuscate) {
    case 'true':
      return '--obfuscate --split-debug-info=$debugInfo';
    case 'false':
      return '';
    default:
      {
        print('\nInvalid obfuscate value, using default: true');
        return '--obfuscate --split-debug-info=$debugInfo';
      }
  }
}

String _identifyType(String target, String type) {
  switch (target) {
    case 'android':
      {
        switch (type) {
          case 'apk':
            return 'APK';
          case 'appbundle':
            return 'AppBundle';
          default:
            {
              print('Type not identified. Using default: AppBundle');
              return 'AppBundle';
            }
        }
      }
    case 'web':
      {
        switch (type) {
          case 'canvaskit':
            return 'CanvasKit';
          case 'html':
            return 'HTML';
          case 'appbundle':
            return 'CanvasKit';
          default:
            {
              print('\nType not identified. Using default: CanvasKit');
              return 'CanvasKit';
            }
        }
      }
    default:
      return '';
  }
}

Future<void> _flutterClean(Shell shell) async {
  print('\n\nClearing Flutter\'s cache...');
  await shell.run('flutter clean');
  print('\nCleaning completed.\n\n');
}

Future<void> _flutterPubGet(Shell shell) async {
  print('Downloading plugins and packages...');
  await shell.run('flutter pub get');
  print('Download of plugins and packages completed.\n\n');
}

Future<void> _flutterBuild(Shell shell, String configFile, String build) async {
  print('Start building...');
  await shell.run(
      'flutter build $build ${configFile.isNotEmpty ? '--dart-define-from-file=$configFile' : ''}');
  print('\nBuilding completed.');
}
