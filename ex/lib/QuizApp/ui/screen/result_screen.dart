import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../../model/player_answer.dart';
import '../widget/score_display.dart';
import '../widget/app_button.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final List<PlayerAnswer> answers;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.quiz,
    required this.answers,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ScoreDisplay(
                  quiz: quiz,
                  answers: answers,
                ),
              ),
              AppButton(label: "Restart Quiz", onPressed: onRestart),
            ],
          ),
        ),
      ),
    );
  }
}