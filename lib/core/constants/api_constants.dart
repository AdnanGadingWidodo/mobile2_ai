import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String get apiKey =>
      dotenv.env['GEMINI_API_KEY'] ?? '';

  static const String baseUrl =
      "https://generativelanguage.googleapis.com/v1/models/gemini-2.5-flash:generateContent";
}
