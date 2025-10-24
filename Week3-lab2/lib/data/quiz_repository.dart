import 'package:my_first_project/domain/quiz.dart';
import './quiz_file_provider.dart';
import 'dart:convert';

class QuizRepository {
  final QuizFileProvider fileProvider;

  QuizRepository(String filePath) : fileProvider = QuizFileProvider(filePath);

  Quiz readQuiz() {
    final content = fileProvider.readFile();
    final data = jsonDecode(content);
    // Map JSON to domain objects
    var questionsJson = data['questions'] as List;
    var questions = questionsJson.map((q) {
      return Question(
        id: q['id'],
        title: q['title'],
        choices: List<String>.from(q['choices']),
        goodChoice: q['goodChoice'],
        score: q['score'],
      );
    }).toList();

    List<Player> players = [];
    if (data.containsKey('players')) {
      final playersJson = data['players'] as List;
      players = playersJson.map((p) {
        return Player(name: p['name'], score: p['score']);
      }).toList();
    }

    return Quiz(id: data['quizId'],questions: questions, players: players);
  }
}
