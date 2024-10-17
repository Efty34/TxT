import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txt/firebase_options.dart';
import 'package:txt/services/auth/auth_gate.dart';
import 'package:txt/themes/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
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
  ---------------
  --> provider
  ---------------
  flutter pub add provider


*/