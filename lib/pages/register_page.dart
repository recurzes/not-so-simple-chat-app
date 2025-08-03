import 'package:flutter/material.dart';
import 'package:not_so_simple_chat_app/services/auth/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Tap to go to login page
  final void Function()? onTap;

  RegisterPage({super.key, this.onTap});

  void register(BuildContext context) async {
    // Get auth service
    final _authService = AuthService();

    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        _authService.signUpWithEmailPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text("Password do not match!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50),

            // Welcome back message
            Text(
              "Welcome back, you've been missed",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // Email textfield
            MyTextField(
              hintText: "Email",
              isPassword: false,
              controller: _emailController,
            ),

            const SizedBox(height: 10),

            // Password textfield
            MyTextField(
              hintText: "Password",
              isPassword: true,
              controller: _passwordController,
            ),

            const SizedBox(height: 10),

            // Password textfield
            MyTextField(
              hintText: "Confirm Password",
              isPassword: true,
              controller: _confirmPasswordController,
            ),

            const SizedBox(height: 25),

            // Login button
            MyButton(text: "Register", onTap: () => register(context)),

            const SizedBox(height: 25),
            // Register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
