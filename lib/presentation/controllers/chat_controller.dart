import 'package:flutter/material.dart';
import '../../data/models/chat_message.dart';
import '../../data/repositories/chat_repository.dart';

class ChatController extends ChangeNotifier {
  final ChatRepository repository;

  ChatController(this.repository);

  final List<ChatMessage> messages = [];
  bool isLoading = false;

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    print("🟡 SEND MESSAGE: $text");

    messages.add(ChatMessage(message: text, isUser: true));
    isLoading = true;
    notifyListeners();

    final response = await repository.sendPrompt(text);

    print("🟢 RESPONSE DARI AI: $response");

    messages.add(
      ChatMessage(
        message: response.isNotEmpty
            ? response
            : "⚠️ AI tidak memberikan jawaban",
        isUser: false,
      ),
    );

    isLoading = false;
    notifyListeners();
  }
}
