import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

main() {
  // Create 2 questions and the quiz
  Question q1 = Question(
      title: "2+2", choices: ["1", "2", "4"], goodChoice: "4", score: 10);

  Question q2 = Question(
      title: "2+3", choices: ["1", "2", "5"], goodChoice: "5", score: 50);

  Quiz quiz = new Quiz(questions: [q1, q2], players: []);

  test('All answers are good (100%)', () {
    // Create the answer here
    Answer a1 = Answer(questionID: quiz.questions[0].id ,question: q1, answerChoice: "4");
    Answer a2 = Answer(questionID: quiz.questions[1].id ,question: q2, answerChoice: "5");

    quiz.answers = [a1, a2];

    // Check something
    expect(quiz.getScoreInPercentage(), equals(100));
  });

  test('Your answers are half good (83%)', () {
    // Create the answer here
    Answer a1 = Answer(questionID: quiz.questions[0].id ,question: q1, answerChoice: "1");
    Answer a2 = Answer(questionID: quiz.questions[1].id ,question: q2, answerChoice: "5");

    quiz.answers = [a1, a2];

    // Check something
    expect(quiz.getScoreInPercentage(), equals(83));
  });

  test('All answers are bad (0%)', () {
    // Create the answer here
    Answer a1 = Answer(questionID: quiz.questions[0].id ,question: q1, answerChoice: "1");
    Answer a2 = Answer(questionID: quiz.questions[1].id ,question: q2, answerChoice: "1");

    quiz.answers = [a1, a2];

    // Check something
    expect(quiz.getScoreInPercentage(), equals(0));
  });

  test('Add new player to quiz.', () {
    Player p1 = Player(name: 'Nita');
    quiz.addPlayer(p1);
    expect(quiz.players[0].name, equals('Nita'));
  });

  test('Add multiple player to the quiz.', () {
    Player p1 = Player(name: 'Nita');
    Player p2 = Player(name: 'Liza');
    quiz.addPlayer(p1);
    quiz.addPlayer(p2);
    expect(quiz.players[0].name, equals('Nita'));
    expect(quiz.players[1].name, equals('Liza'));
  });

  test("Update existing player's score.", () {
    Player p1 = Player(name: 'Nita', score: 100);
    quiz.addPlayer(p1);
    Player updateScore = Player(name: 'Nita', score: 85);
    quiz.addPlayer(updateScore);

    expect(quiz.players[0].name, equals('Nita'));
    expect(quiz.players[0].score, equals(85));
  });

    test('Get question by ID', () {
    Question firstQuestion = quiz.questions[0];
    
    Question? foundQuestion = quiz.getQuestionById(firstQuestion.id);
    
    expect(foundQuestion, isNotNull);
    expect(foundQuestion?.title, equals("2+2"));
  });
}
