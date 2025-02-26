import 'package:args/args.dart';
import 'package:fmagus/src/functions/build_app_function.dart';

void main(List<String> args) {
  final ArgParser argParser = ArgParser();

  argParser.addOption('target', mandatory: true);

  argParser.addOption('configFile', defaultsTo: '');

  argParser.addOption('type', defaultsTo: 'appbundle');

  argParser.addOption('obfuscate', defaultsTo: 'true');

  argParser.addOption('debugInfo', defaultsTo: 'debug');

  final ArgResults results = argParser.parse(args);

  buildApp(
    target: results['target'].toString().toLowerCase(),
    configFile: results['configFile'].toString().toLowerCase(),
    type: results['type'].toString().toLowerCase(),
    obfuscate: results['obfuscate'].toString().toLowerCase(),
    debugInfo: results['debugInfo'].toString().toLowerCase(),
  );
}
