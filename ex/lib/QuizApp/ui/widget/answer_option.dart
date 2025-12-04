import 'package:flutter/material.dart';
import '../../model/answer.dart';
class AnswerOption extends StatelessWidget {
  final Answer answer;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback onTap;

  const AnswerOption({
    super.key,
    required this.answer,
    required this.isSelected,
    required this.isCorrect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          answer.answerChoice,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}