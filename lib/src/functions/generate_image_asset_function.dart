import 'dart:io';

import 'package:image/image.dart';

/// Function to generate an Image Asset of all sizes from a given image.
///
/// Parameters:
/// - [String] path: Path of the image to be used.
/// - [String] assetName: Name of the asset to be generated.
Future<void> generateImageAsset({
  required String path,
  required String assetName,
}) async {
  _checkExists(path);
  final Image image = decodeImage(File(path).readAsBytesSync())!;

  print(_start);

  _createDirectories();

  double newWidth;

  newWidth = _generate(image, assetName, 4, null);
  newWidth = _generate(image, assetName, 3, newWidth);
  newWidth = _generate(image, assetName, 2, newWidth);
  newWidth = _generate(image, assetName, 15, newWidth);
  newWidth = _generate(image, assetName, 1, newWidth);
  newWidth = _generate(image, assetName, 75, newWidth);

  print(_end);

  exit(0);
}

//? PRIVATE
//+ GETTERS
String get _start => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                       Starting Image Asset Generation...                   ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

String get _end => '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║               Image Asset Generation completed successfully!               ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

//+ FUNCTIONS
void _checkExists(String path) {
  if (!File(path).existsSync()) {
    print('\nImage not found.');
    exit(2);
  }
}

void _createDirectories() {
  Directory('lib/assets/images/4.0x').createSync(recursive: true);
  Directory('lib/assets/images/3.0x').createSync();
  Directory('lib/assets/images/2.0x').createSync();
  Directory('lib/assets/images/1.5x').createSync();
  Directory('lib/assets/images/1.0x').createSync();
  Directory('lib/assets/images/0.75x').createSync();
}

double _generate(Image image, String assetName, int x, double? newWidth) {
  switch (x) {
    case 4:
      {
        print('\nGenerating 4.0x image asset...');
        File('lib/assets/images/4.0x/$assetName.png').writeAsBytesSync(
          encodePng(
            image,
          ),
        );
        return image.width.toDouble();
      }
    case 3:
      {
        print('\nGenerating 3.0x image asset...');
        double nu = (newWidth! * 12) / 16;
        File('lib/assets/images/3.0x/$assetName.png').writeAsBytesSync(
          encodePng(
            copyResize(
              image,
              width: nu.toInt(),
              interpolation: Interpolation.linear,
            ),
          ),
        );
        return nu;
      }
    case 2:
      {
        print('\nGenerating 2.0x image asset...');
        double nu = (newWidth! * 8) / 12;
        File('lib/assets/images/2.0x/$assetName.png').writeAsBytesSync(
          encodePng(
            copyResize(
              image,
              width: nu.toInt(),
              interpolation: Interpolation.linear,
            ),
          ),
        );
        return nu;
      }
    case 15:
      {
        print('\nGenerating 1.5x image asset...');
        double nu = (newWidth! * 6) / 8;
        File('lib/assets/images/1.5x/$assetName.png').writeAsBytesSync(
          encodePng(
            copyResize(
              image,
              width: nu.toInt(),
              interpolation: Interpolation.linear,
            ),
          ),
        );
        return nu;
      }
    case 1:
      {
        print('\nGenerating 1.0x image asset...');
        double nu = (newWidth! * 4) / 6;
        File('lib/assets/images/1.0x/$assetName.png').writeAsBytesSync(
          encodePng(
            copyResize(
              image,
              width: nu.toInt(),
              interpolation: Interpolation.linear,
            ),
          ),
        );
        return nu;
      }
    case 75:
      {
        print('\nGenerating 0.75x image asset...');
        double nu = (newWidth! * 3) / 4;
        File('lib/assets/images/0.75x/$assetName.png').writeAsBytesSync(
          encodePng(
            copyResize(
              image,
              width: newWidth.toInt(),
              interpolation: Interpolation.linear,
            ),
          ),
        );
        return nu;
      }
    default:
      {
        print('\nError generating image asset.');
        exit(2);
      }
  }
}
