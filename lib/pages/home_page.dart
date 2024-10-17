import 'package:flutter/material.dart';
import 'package:txt/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // logout logic here
  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: logout,
          ),
        ],
      ),
    );
  }
}
