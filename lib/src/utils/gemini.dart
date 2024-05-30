import 'dart:io';

import 'package:camera/camera.dart';
import 'package:food_focus/src/utils/apiKey.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

//https://ai.google.dev/gemini-api/docs/get-started/tutorial?lang=dart#flutter
//https://ai.google.dev/gemini-api/docs/api-overview#dart-flutter

//This is where the magic happens!
//This class takes an Xfile, processes the file at the path end into bytes, and serves it up to Google Gemini for classification
//After classification, this response will be parsed into a Food object that we can display to the user
class Gemini {
  static Future identifyImage(XFile image) async {
    //This api key is stored in a file not committed to git
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

    final content = [
      Content.multi([
        TextPart(prompt),
        DataPart('image/png', imageBytes),
      ])
    ];

    final response = await model.generateContent(
        content); //Send the model a request with the prompt and encoded image

    return response.text; //Return the text field of the response JSON
  }
}
