import 'dart:io';

/// Function to create Route Generator
void providerScope() {
  print(_start);

  _createProviderScope();

  print(_end);
}

//? PRIVATE
//+ GETTERS
String get _start => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                      Starting Creating ProviderScope...                    ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

String get _end => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║               ProviderScope Creating completed successfully!               ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

String get _providerScope => '''
import 'package:provider/provider.dart';

class ProviderScope extends MultiProvider {
  final App app;
  ProviderScope({
    super.key,
    required this.app,
  }) : super(
          child: app,
          providers: [
            YourProvidersHere...
          ],
        );
}
''';

//+ FUNCTIONS
void _createProviderScope() {
  print('\n\nCreating ProviderScope...\n');
  Directory('lib/src/widgets').createSync(recursive: true);
  File(
    'lib/src/widgets/provider_scope_widget.dart',
  ).writeAsStringSync(_providerScope, mode: FileMode.writeOnly);
  print('Creating Completed.');
}
