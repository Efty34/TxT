import 'package:flutter/material.dart';
import 'package:txt/components/my_drawer.dart';
import 'package:txt/components/user_tile.dart';
import 'package:txt/pages/chat_page.dart';
import 'package:txt/services/auth/auth_service.dart';
import 'package:txt/services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // logout logic here
  void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    // Get the current user's email
    String email = _authService.getCurrentUser()?.email ?? "Home";
    // Extract the part before '@'
    String emailPrefix = email.split('@')[0];
    // Capitalize the first letter of the email prefix
    String capitalizedPrefix = emailPrefix.isNotEmpty
        ? emailPrefix[0].toUpperCase() + emailPrefix.substring(1)
        : emailPrefix;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          capitalizedPrefix,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.outline,
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  // build user list
  Widget _buildUserList() {
    // Get the current logged-in user
    final loggedInUser = _authService.getCurrentUser();

    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        // loading...
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Filter the list of users, excluding the logged-in user
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final users = snapshot.data!
              .where((user) => user['email'] != loggedInUser?.email)
              .toList();

          // Return list view
          return ListView(
            children: users
                .map<Widget>(
                    (userData) => _buildUserListItem(userData, context))
                .toList(),
          );
        } else {
          return const Center(child: Text("No users found"));
        }
      },
    );
  }

  // build user list item
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    // Check if email exists to avoid potential errors
    if (userData.containsKey('email')) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          // tapped on a user -> go to chat page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
              ),
            ),
          );
        },
      );
    } else {
      return const SizedBox.shrink(); // Return empty widget if no email
    }
  }
}
