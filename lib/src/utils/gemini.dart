import 'dart:io';

import 'package:camera/camera.dart';
import 'package:food_focus/src/utils/apiKey.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

//https://ai.google.dev/gemini-api/docs/get-started/tutorial?lang=dart#flutter
//https://ai.google.dev/gemini-api/docs/api-overview#dart-flutter

class Gemini {
  static Future identifyImage(XFile image) async {
    //final apiKey = Platform.environment['GEMINI_API_KEY'];
    const apiKey = Apikey.key;
    if (apiKey == null) {
      print('No \$API_KEY environment variable');
      exit(1);
    }
    // For text-and-image input (multimodal), use the gemini-pro-vision model
    final model = GenerativeModel(model: 'gemini-pro-vision', apiKey: apiKey);
    const prompt =
        """Give me the just the name of the food or drink in this image on the first line and then give me several lines (5+) of nutritional information (line by line). Here's an example of the formatting:
    Mashed Potatoes
    Calories: 250
    Protein: 10g
    Sodium: 20mg
    Calcium: 40mg
    """;
    final imageBytes = await image.readAsBytes();

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

    return response.text;
  }
}
