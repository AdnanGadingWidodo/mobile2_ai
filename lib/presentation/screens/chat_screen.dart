import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/chat_controller.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/input_field.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ChatController>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "EduAI Assistant",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: controller.messages.isEmpty
                ? const _EmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      return ChatBubble(
                        message: controller.messages[index],
                      );
                    },
                  ),
          ),

          if (controller.isLoading)
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: CircularProgressIndicator(),
            ),

          InputField(
            onSend: controller.sendMessage,
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.smart_toy,
            size: 80,
            color: Colors.indigo,
          ),
          SizedBox(height: 16),
          Text(
            "Halo 👋\nTanya apa saja tentang Informatika",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
