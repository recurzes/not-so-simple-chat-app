import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:not_so_simple_chat_app/services/auth/auth_gate.dart';
import 'package:not_so_simple_chat_app/firebase_options.dart';
import 'package:not_so_simple_chat_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import '/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(create: (context) => ThemeProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: SafeArea(child: AuthGate()),
    );
  }
}
