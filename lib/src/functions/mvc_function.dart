import 'dart:io';

/// Function to create MVC directory structure
void mvc() {
  print(_start);

  _createAssetsStructure();
  _createMVCStructure();
  _createExtra();

  print(_end);
}

//? PRIVATE
//+ GETTERS
String get _start => '''

  ╔════════════════════════════════════════════════════════════════════════════╗
  ║                                🧙 FMAGUS 🧙                                ║
  ╠════════════════════════════════════════════════════════════════════════════╣
  ║                           Starting Creating MVC...                         ║
  ╚════════════════════════════════════════════════════════════════════════════╝
  ''';

String get _end => '''

  ╔════════════════════════════════════════════════════════════════════════════╗
  ║                                🧙 FMAGUS 🧙                                ║
  ╠════════════════════════════════════════════════════════════════════════════╣
  ║                     MVC Creating completed successfully!                   ║
  ╚════════════════════════════════════════════════════════════════════════════╝
  ''';

//+ FUNCTIONS
void _createAssetsStructure() {
  print('\n\nCreating Assets Directories...\n');
  Directory('lib/assets/images/4.0x').createSync(recursive: true);
  Directory('lib/assets/images/3.0x').createSync();
  Directory('lib/assets/images/2.0x').createSync();
  Directory('lib/assets/images/1.5x').createSync();
  Directory('lib/assets/images/1.0x').createSync();
  Directory('lib/assets/images/0.75x').createSync();
  Directory('lib/assets/resources').createSync();
  print('Creating completed.\n\n');
}

void _createMVCStructure() {
  print('\n\nCreating MVC Directories...\n');
  Directory('lib/src/models').createSync(recursive: true);
  Directory('lib/src/views').createSync();
  Directory('lib/src/controllers').createSync();
  print('Creating completed.\n\n');
}

void _createExtra() {
  print('\n\nCreating Extra Directories...\n');
  Directory('lib/src/app/configs').createSync(recursive: true);
  Directory('lib/src/app/platforms').createSync();
  Directory('lib/src/repositories/interfaces').createSync(recursive: true);
  Directory('lib/src/configs').createSync();
  Directory('lib/src/services').createSync();
  Directory('lib/src/helpers').createSync();
  Directory('lib/src/widgets').createSync();
  Directory('lib/src/constants').createSync();
  Directory('lib/src/validators').createSync();
  print('Creating completed.');
}
