import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:not_so_simple_chat_app/services/auth/auth_gate.dart';
import 'package:not_so_simple_chat_app/services/auth/login_or_register.dart';
import 'package:not_so_simple_chat_app/firebase_options.dart';
import 'package:not_so_simple_chat_app/pages/register_page.dart';
import '/pages/login_page.dart';
import '/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: SafeArea(child: AuthGate()),
    );
  }
}
