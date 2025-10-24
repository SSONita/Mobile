import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import 'data/quiz_repository.dart';

void main() {
  // List<Question> questions = [
  //   Question(
  //       title: "Capital of France? - (10 points)",
  //       choices: ["Paris", "London", "Rome"],
  //       goodChoice: "Paris",
  //       score: 10),
  //   Question(
  //       title: "2 + 2 = ? - (50 points)",
  //       choices: ["2", "4", "5"],
  //       goodChoice: "4",
  //       score: 50),
  // ];
  // List<Player> players = [];

  // Quiz quiz = Quiz(questions: questions, players: players);

  // QuizConsole console = QuizConsole(quiz: quiz);
  QuizRepository repo = QuizRepository('data/quiz_data.json');
  Quiz quiz = repo.readQuiz();
  QuizConsole console = QuizConsole(quiz: quiz, repository: repo);

  console.startQuiz();
}
