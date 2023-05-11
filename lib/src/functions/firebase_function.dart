import 'dart:io';

import 'package:process_run/shell_run.dart';

/// Function to add MobX Packages
Future<void> firebase() async {
  final Shell shell = Shell();

  print(_start);

  await _importFirebase(shell);

  print(_end);

  exit(0);
}

//? PRIVATE
//+ GETTERS
String get _start => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║               Starting Importing Firebase Basic Packages...                ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

String get _end => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║          Firebase Basic Packages Importing completed successfully!         ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

//+ FUNCTIONS
Future<void> _importFirebase(Shell shell) async {
  print('\n\nImporting...\n');
  await shell.run('flutter pub add firebase_core');
  await shell.run('flutter pub add firebase_app_check');
  await shell.run('flutter pub add firebase_auth');
  await shell.run('flutter pub add cloud_firestore');
  print('Importing completed.');
}
