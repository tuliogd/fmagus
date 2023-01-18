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
  if (!File(path).existsSync()) {
    print('\nImage not found.');
    exit(2);
  }

  String start = '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║                       Starting Image Asset Generation...                   ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

  print(start);

  print('\nGenerating Image Asset...\n');
  print('\nGenerating 4.0x image asset...');
  Image image = decodeImage(File(path).readAsBytesSync())!;
  Directory('lib/assets/images/4.0x').createSync(recursive: true);
  Directory('lib/assets/images/3.0x').createSync();
  Directory('lib/assets/images/2.0x').createSync();
  Directory('lib/assets/images/1.5x').createSync();
  Directory('lib/assets/images/1.0x').createSync();
  Directory('lib/assets/images/0.75x').createSync();
  File('lib/assets/images/4.0x/$assetName.png').writeAsBytesSync(
    encodePng(
      image,
    ),
  );

  print('\nGenerating 3.0x image asset...');
  int width = image.width;
  double newWidth = (width * 12) / 16;
  File('lib/assets/images/3.0x/$assetName.png').writeAsBytesSync(
    encodePng(
      copyResize(
        image,
        width: newWidth.toInt(),
        interpolation: Interpolation.linear,
      ),
    ),
  );

  print('\nGenerating 2.0x image asset...');
  newWidth = (newWidth * 8) / 12;
  File('lib/assets/images/2.0x/$assetName.png').writeAsBytesSync(
    encodePng(
      copyResize(
        image,
        width: newWidth.toInt(),
        interpolation: Interpolation.linear,
      ),
    ),
  );

  print('\nGenerating 1.5x image asset...');
  newWidth = (newWidth * 6) / 8;
  File('lib/assets/images/1.5x/$assetName.png').writeAsBytesSync(
    encodePng(
      copyResize(
        image,
        width: newWidth.toInt(),
        interpolation: Interpolation.linear,
      ),
    ),
  );

  print('\nGenerating 1.0x image asset...');
  newWidth = (newWidth * 4) / 6;
  File('lib/assets/images/1.0x/$assetName.png').writeAsBytesSync(
    encodePng(
      copyResize(
        image,
        width: newWidth.toInt(),
        interpolation: Interpolation.linear,
      ),
    ),
  );

  print('\nGenerating 0.75x image asset...');
  newWidth = (newWidth * 3) / 4;
  File('lib/assets/images/0.75x/$assetName.png').writeAsBytesSync(
    encodePng(
      copyResize(
        image,
        width: newWidth.toInt(),
        interpolation: Interpolation.linear,
      ),
    ),
  );
  print('Image Asset Generation is complete.');
  String end = '''



╔════════════════════════════════════════════════════════════════════════════╗
║                                🧙 FMAGUS 🧙                                ║
╠════════════════════════════════════════════════════════════════════════════╣
║               Image Asset Generation completed successfully!               ║
╚════════════════════════════════════════════════════════════════════════════╝
''';

  print(end);

  exit(0);
}
