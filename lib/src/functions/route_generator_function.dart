import 'dart:io';

/// Function to create Route Generator
void routeGenerator() {
  print(_start);

  _createRouteGenerator();

  print(_end);
}

//? PRIVATE
//+ GETTERS
String get _start => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                      Starting Creating RouteGenerator...                   ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

String get _end => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║              RouteGenerator Creating completed successfully!               ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

String get _routeGenerator => '''
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'YourRouteName':
        return _router(
          YourPage(),
          settings: settings,
          authNeed: (true if this page need authentication or false if not),
        );
      default:
        return _router(
          const Your404Page(),
          authNeed: false,
        );
    }
  }

  // PRIVATE METHODS
  static MaterialPageRoute _router(
    Widget page, {
    RouteSettings? settings,
    bool authNeed = true,
  }) =>
      MaterialPageRoute(
        settings: settings,
        builder: (_) =>
            _isAuthenticated(authNeed) ? page : const Your403Page(),
      );

  static bool _isAuthenticated(bool authNeed) =>
      !authNeed ? true : (your authentication logic here);
}
''';

//+ FUNCTIONS
void _createRouteGenerator() {
  print('\n\nCreating RouteGenerator...\n');
  File('lib/route_generator.dart').writeAsStringSync(
    _routeGenerator,
    mode: FileMode.writeOnly,
  );
  print('Creating Completed.');
}
