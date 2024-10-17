import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:txt/services/auth/auth_gate.dart';
import 'package:txt/firebase_options.dart';
import 'package:txt/themes/light_mode.dart';

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
      home: const AuthGate(),
      theme: lightMode,
    );
  }
}

/*
  ---------------
  npm install -g firebase-tools
  ---------------
  firebase login
  ---------------
  flutter pub global activate flutterfire_cli
  ---------------
  flutterfire configure
  ---------------
  flutter pub add firebase_core
  ---------------
  flutter pub add firebase_auth
  ---------------
  --> add these before start the chat functionality
  ---------------
  flutter pub add cloud_firestore


*/