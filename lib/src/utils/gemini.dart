import 'dart:io';

import 'package:camera/camera.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

//https://ai.google.dev/gemini-api/docs/get-started/tutorial?lang=dart#flutter
//https://ai.google.dev/gemini-api/docs/api-overview#dart-flutter

class Gemini {
  static Future identifyImage(XFile image) async {
    final apiKey = Platform.environment['GEMINI_API_KEY'];
    if (apiKey == null) {
      print('No \$API_KEY environment variable');
      exit(1);
    }
    // For text-and-image input (multimodal), use the gemini-pro-vision model
    final model = GenerativeModel(model: 'gemini-pro-vision', apiKey: apiKey);
    const prompt =
        'Tell me the food in this image and then give the nutritional information (line by line)';
    final imageBytes = await File(image.path).readAsBytes();

    // final (catBytes, sconeBytes) = await (
    //   readResource('cat.jpg'),
    //   readResource('scones.jpg'),
    // ).wait;

    final content = [
      Content.multi([
        TextPart(prompt),
        DataPart('image/png', imageBytes),
      ])
    ];

    final response = await model.generateContent(content);

    return response;
  }
}
