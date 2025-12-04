import './answer.dart';
class Question {
  final String id;
  final String title;
  final List<Answer> answers;
  final String correctAnswer;

  Question({
    required this.id,
    required this.title,
    required this.answers,
    required this.correctAnswer,
  });
}