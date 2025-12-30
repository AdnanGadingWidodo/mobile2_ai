import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_constants.dart';

class GeminiService {
  Future<String> generateResponse(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse("${ApiConstants.baseUrl}?key=${ApiConstants.apiKey}"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": prompt}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["candidates"][0]["content"]["parts"][0]["text"];
      } else {
        return "❌ Error ${response.statusCode}\n${response.body}";
      }
    } catch (e) {
      return "⚠️ Terjadi kesalahan koneksi: $e";
    }
  }
}
