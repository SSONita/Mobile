import 'dart:io';
import '../data/quiz_repository.dart';
import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;
  QuizRepository repository;

  QuizConsole({required this.quiz, required this.repository});

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');
    while (true) {
      stdout.write('Enter your name: ');
      String? name = stdin.readLineSync();

      if (name != null && name.isNotEmpty) {
        print("Player: $name");
        for (var question in quiz.questions) {
          print('Question: ${question.title}');
          print('Choices: ${question.choices}');
          stdout.write('Your answer: ');
          String? userInput = stdin.readLineSync();

          // Check for null input
          if (userInput != null && userInput.isNotEmpty) {
            Answer answer = Answer(
                questionID: question.id,
                question: question,
                answerChoice: userInput);
            quiz.addAnswer(answer);
          } else {
            print('No answer entered. Skipping question.');
          }

          print('');
        }

        int score = quiz.getScoreInPercentage();
        int point = quiz.getScoreInPoint();
        Player player = Player(name: name, score: score);
        quiz.addPlayer(player);
        print('--- Quiz Finished ---');
        print('${name}, Your score in percentage: $score %.');
        print('${name}, Your score in point: $point point.');

        print("--- Leaderboard ---");
        for (var player in quiz.players) {
          print('${player.name}: ${player.score} %');
        }
        quiz.answers.clear();
      } else {
        break;
      }
    }
  }
}
