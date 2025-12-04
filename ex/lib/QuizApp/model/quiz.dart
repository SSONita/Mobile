import './question.dart';
class Quiz {
  final String id;
  final String name;
  final List<Question> questions;

  Quiz({required this.id, required this.name, required this.questions});
}