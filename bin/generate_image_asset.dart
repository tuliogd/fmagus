import 'package:args/args.dart';
import 'package:fmagus/src/functions/generate_image_asset_function.dart';

void main(List<String> args) {
  final ArgParser argParser = ArgParser();

  argParser.addOption(
    'path',
    mandatory: true,
  );

  argParser.addOption(
    'assetName',
    mandatory: true,
  );

  ArgResults results = argParser.parse(args);

  generateImageAsset(
    path: results['path'].toString().toLowerCase(),
    assetName: results['assetName'].toString().toLowerCase(),
  );
}
