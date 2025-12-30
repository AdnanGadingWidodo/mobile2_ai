import '../services/gemini_service.dart';

class ChatRepository {
  final GeminiService service;

  ChatRepository(this.service);

  Future<String> sendPrompt(String prompt) async {
    return await service.generateResponse(prompt);
  }
}
