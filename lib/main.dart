import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/theme/app_theme.dart';
import 'data/services/gemini_service.dart';
import 'data/repositories/chat_repository.dart';
import 'presentation/controllers/chat_controller.dart';
import 'presentation/screens/chat_screen.dart';

Future<void> main() async {
  // WAJIB load .env sebelum runApp
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatController(
            ChatRepository(GeminiService()),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const ChatScreen(),
      ),
    );
  }
}
