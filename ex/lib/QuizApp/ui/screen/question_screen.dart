import 'package:flutter/material.dart';
import '../../model/question.dart';
import '../../model/player_answer.dart';
import '../widget/answer_option.dart';
import '../widget/question_card.dart';

class QuestionScreen extends StatefulWidget {
  final Question question;
  final Function(PlayerAnswer) onAnswer;

  const QuestionScreen({
    super.key,
    required this.question,
    required this.onAnswer,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  String? selectedAnswerId;

  void submitAnswer(String answerId) {
    final isCorrect = answerId == widget.question.correctAnswer;
    final playerAnswer = PlayerAnswer(
      id: UniqueKey().toString(),
      questionId: widget.question.id,
      answerId: answerId,
      isCorrect: isCorrect,
      timeStamp: DateTime.now(),
    );
    widget.onAnswer(playerAnswer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QuestionCard(question: widget.question),
              ...widget.question.answers.map((answer) {
                return AnswerOption(
                  answer: answer,
                  isSelected: selectedAnswerId == answer.id,
                  isCorrect: answer.id == widget.question.correctAnswer,
                  onTap: () {
                    setState(() => selectedAnswerId = answer.id);
                    submitAnswer(answer.id);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

