import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiHelper {
  ApiHelper._();
  static final ApiHelper apiHelper = ApiHelper._();
  Logger logger = Logger();
  List ai = [];
  String uri =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=AIzaSyAaonJPDXk6xPQbCS51-cHurnO_mP5Q2K0";
  Future<String> init({required String text}) async {
    http.Response response = await http.post(Uri.parse(uri),
        body: jsonEncode(
          {
            "contents": [
              {
                "parts": [
                  {"text": text}
                ]
              }
            ]
          },
        ),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      // List candidates = data['candidates'];
      // Map content = candidates['content'];
      // List parts = content['parts'][0];
      // String text = parts['text'].toString();
      return data['candidates'][0]['content']['parts'][0]['text'].toString();
    }

    return "No Data";
  }
}
