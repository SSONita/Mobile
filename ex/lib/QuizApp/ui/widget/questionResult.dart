import 'package:flutter/material.dart';
import '../../model/question.dart';
import '../../model/player_answer.dart';
class QuestionResult extends StatelessWidget {
  final Question question;
  final PlayerAnswer playerAnswer;

  const QuestionResult({
    super.key,
    required this.question,
    required this.playerAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question.title, style: TextStyle(fontSize: 18)),
            ...question.answers.map((ans) {
              final isCorrect = ans.id == question.correctAnswer;
              final isSelected = ans.id == playerAnswer.answerId;
              Color? color;
              if (isCorrect) color = Colors.green;
              if (isSelected && !isCorrect) color = Colors.red;

              return Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color ?? Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(ans.answerChoice),
              );
            })
          ],
        ),
      ),
    );
  }
}
