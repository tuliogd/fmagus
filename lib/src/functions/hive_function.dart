import 'dart:io';

import 'package:process_run/shell_run.dart';

/// Function to add MobX Packages
/// Parameters:
/// - [String] generator: Whether to add the generator or not.
Future<void> hive({required String generator}) async {
  final Shell shell = Shell();

  print(_start);

  bool gen = _identifyGenerator(generator);

  await _importHive(shell, gen);

  print(_end);

  exit(0);
}

//? PRIVATE
//+ GETTERS
String get _start => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                          Starting Importing Hive...                        ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

String get _end => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                    Hive Importing completed successfully!                  ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

//+ FUNCTIONS
Future<void> _importHive(Shell shell, bool generator) async {
  print('\n\nImporting...\n');
  await shell.run('flutter pub add hive');
  await shell.run('flutter pub add hive_flutter');

  if (generator) {
    await shell.run('flutter pub add -d hive_generator');
    await shell.run('flutter pub add -d build_runner');
  }

  print('Importing completed.');
}

bool _identifyGenerator(String generator) {
  if (generator == 'true') {
    return true;
  } else if (generator == 'false') {
    return false;
  } else {
    print(
      '\nThe generator parameter was not recognized. Using default: false\n',
    );
    return false;
  }
}
