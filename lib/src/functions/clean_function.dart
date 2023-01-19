import 'dart:io';

import 'package:process_run/shell_run.dart';

/// Flutter Cleaning Function
Future<void> cleanFlutter() async {
  final Shell shell = Shell();

  print(_start);

  await _flutterClean(shell);
  await _flutterPubGet(shell);

  print(_end);

  exit(0);
}

//? PRIVATE
//+ GETTERS
String get _start => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                          Starting Flutter Cleaning...                      ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

String get _end => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                      Cleaning completed successfully!                      ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

//+ FUNCTIONS
Future<void> _flutterClean(Shell shell) async {
  print('\n\nCleaning Flutter Cache...\n');
  await shell.run('flutter clean');
  print('Cleaning completed.\n\n');
}

Future<void> _flutterPubGet(Shell shell) async {
  print('Downloading plugins and packages...\n');
  await shell.run('flutter pub get');
  print('Download e atualização dos plugins e packages concluídos.');
}
