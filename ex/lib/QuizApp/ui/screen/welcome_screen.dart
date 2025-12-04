import 'package:flutter/material.dart';
import '../widget/app_button.dart';
class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;

  const WelcomeScreen({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Flutter logo or quiz logo
            Icon(Icons.quiz, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              "Welcome to the Quiz!",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            // Reusable AppButton
            AppButton(label: "Start Quiz", onPressed: onStart),
          ],
        ),
      ),
    );
  }
}