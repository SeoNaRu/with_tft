import 'package:image/image.dart' as img;
import 'package:flutter/services.dart';

Future<Color> getMostFrequentColor(String assetPath) async {
  final ByteData data = await rootBundle.load(assetPath);
  final img.Image image = img.decodeImage(Uint8List.view(data.buffer))!;

  final Map<int, int> colorFrequency = {};

  for (int y = 0; y < image.height; y++) {
    for (int x = 0; x < image.width; x++) {
      img.Pixel pixel = image.getPixel(x, y); // 픽셀 색상 정보를 int 형태로 직접 얻음
      print('색상 받기 ${pixel}');
      // colorFrequency[pixel] = (colorFrequency[pixel] ?? 0) + 1;
    }
  }

  final int mostFrequentColorValue =
      colorFrequency.entries.reduce((a, b) => a.value > b.value ? a : b).key;

  return Color(mostFrequentColorValue | 0xFF000000);
}
