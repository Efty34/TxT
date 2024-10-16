import 'package:flutter/material.dart';
import 'package:txt/components/my_button.dart';
import 'package:txt/components/my_textfield.dart';
import 'package:txt/utils/app_media.dart';

class RegisterPage extends StatelessWidget {
  // email and pw text controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  // tap to go to login page
  final void Function()? onTap;

  RegisterPage({super.key, this.onTap});

  // login function
  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Image.asset(
              AppMedia.logo,
              width: 80,
              height: 80,
            ),

            const SizedBox(
              height: 50,
            ),
            // welcome back message
            Text(
              "Let's create an account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // --> email textfield
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(
              height: 10,
            ),

            // --> pw textfield
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _pwController,
            ),

            const SizedBox(
              height: 10,
            ),

            // --> confrim pw textfield
            MyTextfield(
              hintText: "Confirm password",
              obscureText: true,
              controller: _confirmPwController,
            ),

            const SizedBox(
              height: 25,
            ),

            // --> login button
            MyButton(
              text: "Resgister",
              onTap: register,
            ),

            const SizedBox(
              height: 25,
            ),

            // --> register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
