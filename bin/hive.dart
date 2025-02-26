import 'package:args/args.dart';
import 'package:fmagus/src/functions/hive_function.dart';

void main(List<String> args) {
  final ArgParser argParser = ArgParser();

  argParser.addOption('generator', defaultsTo: 'false');

  final ArgResults results = argParser.parse(args);

  hive(generator: results['generator']);
}
