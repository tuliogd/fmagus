import 'dart:io';

import 'package:process_run/shell_run.dart';

/// Função para compilar o App
///
/// Parâmetros:
/// - [String] target: Plataforma na qual o App será compilado.
/// - [String] type: Tipo de build (apk, appBundle, ipa, canvaskit etc).
/// - [String] obfuscate: Ofuscar ou não o código do App (true/false).
Future<void> buildApp({
  required String target,
  required String type,
  String? obfuscate,
}) async {
  String obfuscateString =
      obfuscate == 'true' ? '--obfuscate --split-debug-info=debug' : '';

  String end = '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 MAGUS 🧙                                 ║
╠════════════════════════════════════════════════════════════════════════════╣
║ Build concluída com êxito!                                                 ║
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

              print('Type não identificado. Utilizando o padrão: $tipo');
            }
            break;
        }

        String start = '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 MAGUS 🧙                                 ║
╠════════════════════════════════════════════════════════════════════════════╣
║                       Iniciando building para Android                      ║
╚════════════════════════════════════════════════════════════════════════════╝

Obfuscate: $obfuscate
Type: $tipo
''';

        print(start);

        print('\n\nLimpando cache do Flutter...');
        Shell shell = Shell();
        await shell.run('flutter clean');
        print('\nLimpeza concluída.\n\n');

        print('Baixando os plugins e packages...');
        await shell.run('flutter pub get');
        print('Download dos plugins e packages completados.\n\n');

        print('Iniciando building...');
        await shell.run('flutter build $type $obfuscateString --release');
        print('\nBuild concluída.');

        print(end);

        exit(0);
      }
    case 'ios':
      {
        String start = '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 MAGUS 🧙                                 ║
╠════════════════════════════════════════════════════════════════════════════╣
║                       Iniciando building para iOS                          ║
╚════════════════════════════════════════════════════════════════════════════╝

Obfuscate: $obfuscate
Type: iOS Package App Store (IPA)
''';

        print(start);

        print('\n\nLimpando cache do Flutter...');
        Shell shell = Shell();
        await shell.run('flutter clean');
        print('\nLimpeza concluída.\n\n');

        print('Baixando os plugins e packages...');
        await shell.run('flutter pub get');
        print('\nDownload dos plugins e packages completados.\n\n');

        print('Iniciando building...');

        await shell.run('flutter build ipa $obfuscateString --release');
        print('\nBuild concluída.');

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

              print('Type não identificado. Utilizando o padrão: $tipo');
            }
            break;
        }

        String start = '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 MAGUS 🧙                                 ║
╠════════════════════════════════════════════════════════════════════════════╣
║                       Iniciando building para Web                          ║
╚════════════════════════════════════════════════════════════════════════════╝

Type: $tipo
''';

        print(start);

        print('\n\nLimpando cache do Flutter...');
        Shell shell = Shell();
        await shell.run('flutter clean');
        print('\nLimpeza concluída.\n\n');

        print('Baixando os plugins e packages...');
        await shell.run('flutter pub get');
        print('Download dos plugins e packages completados.\n\n');

        print('Iniciando building...');
        await shell.run('flutter build web --web-renderer $type --release');
        print('\nBuild concluída.');

        print(end);

        exit(0);
      }
    case 'macos':
      {
        String start = '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 MAGUS 🧙                                 ║
╠════════════════════════════════════════════════════════════════════════════╣
║                       Iniciando building para macOS                        ║
╚════════════════════════════════════════════════════════════════════════════╝

Obfuscate: $obfuscate
''';

        print(start);

        print('\n\nLimpando cache do Flutter...');
        Shell shell = Shell();
        await shell.run('flutter clean');
        print('\nLimpeza concluída.\n\n');

        print('Baixando os plugins e packages...');
        await shell.run('flutter pub get');
        print('Download dos plugins e packages completados.\n\n');

        print('Iniciando building...');
        await shell.run('flutter build macos $obfuscateString --release');
        print('\nBuild concluída.');

        print(end);

        exit(0);
      }
    case 'windows':
      {
        String start = '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 MAGUS 🧙                                 ║
╠════════════════════════════════════════════════════════════════════════════╣
║                       Iniciando building para Windows                      ║
╚════════════════════════════════════════════════════════════════════════════╝

''';

        print(start);

        print('\n\nLimpando cache do Flutter...');
        Shell shell = Shell();
        await shell.run('flutter clean');
        print('\nLimpeza concluída.\n\n');

        print('Baixando os plugins e packages...');
        await shell.run('flutter pub get');
        print('Download dos plugins e packages completados.\n\n');

        print('Iniciando building...');
        await shell.run('flutter build windows --release');
        print('\nBuild concluída.');

        print(end);

        exit(0);
      }
    case 'linux':
      {
        String start = '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 MAGUS 🧙                                 ║
╠════════════════════════════════════════════════════════════════════════════╣
║                       Iniciando building para Linux                        ║
╚════════════════════════════════════════════════════════════════════════════╝

''';

        print(start);

        print('\n\nLimpando cache do Flutter...');
        Shell shell = Shell();
        await shell.run('flutter clean');
        print('\nLimpeza concluída.\n\n');

        print('Baixando os plugins e packages...');
        await shell.run('flutter pub get');
        print('Download dos plugins e packages completados.\n\n');

        print('Iniciando building...');
        await shell.run('flutter build linux --release');
        print('\nBuild concluída.');

        print(end);

        exit(0);
      }
    default:
      {
        print('\nO Target é inválido.');
        exit(2);
      }
  }
}
