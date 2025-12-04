import 'package:flutter/material.dart';
import 'model/quiz.dart';
import 'model/player_answer.dart';
import 'data/repositories/quiz_mock_repository.dart';
import 'ui/screen/welcome_screen.dart';
import 'ui/screen/question_screen.dart';
import 'ui/screen/result_screen.dart';

void main() {
  runApp(MaterialApp(home: QuizApp()));
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int currentIndex = 0;
  List<PlayerAnswer> answers = [];

  late final Quiz quiz;

  @override
  void initState() {
    super.initState();
    quiz = QuizMockRepository().loadQuiz();
  }

  void handleAnswer(PlayerAnswer answer) {
    setState(() {
      answers.add(answer);
      currentIndex++;
    });
  }

  void restartQuiz() {
    setState(() {
      currentIndex = 0;
      answers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 0) {
      return WelcomeScreen(onStart: () => setState(() => currentIndex = 1));
    } else if (currentIndex <= quiz.questions.length) {
      return QuestionScreen(
        question: quiz.questions[currentIndex - 1],
        onAnswer: handleAnswer,
      );
    } else {
      return ResultScreen(
        quiz: quiz,
        answers: answers,
        onRestart: restartQuiz,
      );
    }
  }
}