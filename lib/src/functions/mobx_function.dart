import 'dart:io';

import 'package:process_run/shell_run.dart';

/// Function to add MobX Packages
Future<void> mobx() async {
  final Shell shell = Shell();

  print(_start);

  await _importMobx(shell);

  print(_end);

  exit(0);
}

//? PRIVATE
//+ GETTERS
String get _start => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                          Starting Importing MobX...                        ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

String get _end => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                    MobX Importing completed successfully!                  ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

//+ FUNCTIONS
Future<void> _importMobx(Shell shell) async {
  print('\n\nImporting...\n');
  await shell.run('flutter pub add mobx');
  await shell.run('flutter pub add flutter_mobx');
  await shell.run('flutter pub add -d mobx_codegen');
  await shell.run('flutter pub add -d build_runner');
  print('Importing completed.\n\n');
}
