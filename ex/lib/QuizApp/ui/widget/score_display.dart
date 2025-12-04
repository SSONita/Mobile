import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../../model/player_answer.dart';
import '../widget/questionResult.dart';

class ScoreDisplay extends StatelessWidget {
  final Quiz quiz;
  final List<PlayerAnswer> answers;

  const ScoreDisplay({
    super.key,
    required this.quiz, 
    required this.answers
  });

  @override
  Widget build(BuildContext context) {
    final correctCount = answers.where((a) => a.isCorrect).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You answered $correctCount on ${quiz.questions.length}!",
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: quiz.questions.length,
            itemBuilder: (context, index) {
              final q = quiz.questions[index];
              final a = answers.firstWhere((x) => x.questionId == q.id);
              return QuestionResult(question: q, playerAnswer: a);
            },
          ),
        ),
      ],
    );
  }
}
