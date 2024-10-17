import 'package:flutter/material.dart';
import 'package:txt/services/auth/auth_service.dart';
import 'package:txt/pages/settings_page.dart';
import 'package:txt/utils/app_media.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  // logout action
  void logout() {
    // get auth service
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // --> logo
              DrawerHeader(
                decoration: const BoxDecoration(),
                child: Center(
                  child: // logo
                      Image.asset(
                    AppMedia.logo,
                    width: 80,
                    height: 80,
                  ),
                ),
              ),

              // --> home list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("H O M E"),
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);
                  },
                ),
              ),

              // --> settings list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
                  leading: Icon(Icons.settings,
                      color: Theme.of(context).colorScheme.outline),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);

                    //navigate to settings page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          // --> logout list tile
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              bottom: 25,
            ),
            child: ListTile(
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
              leading: const Icon(Icons.logout, color: Colors.red),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
