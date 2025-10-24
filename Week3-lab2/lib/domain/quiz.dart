import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int score;

  Question(
      {String? id,
      required this.title,
      required this.choices,
      required this.goodChoice,
      required this.score})
      : id = id ?? uuid.v4();
}

class Answer {
  final String questionID;
  final Question question;
  final String answerChoice;

  Answer(
      {required this.questionID,
      required this.question,
      required this.answerChoice});

  bool isGood() {
    return (this.answerChoice == question.goodChoice);
  }
}

class Player {
  final String? name;
  final int? score;
  final Map<String, String>? answers;

  Player({this.name, this.score = 0, this.answers});
}

class Quiz {
  final String id;
  List<Question> questions;
  List<Answer> answers = [];
  List<Player> players = [];

  Quiz({String? id, required this.questions, required this.players})
      : id = id ?? uuid.v4();

  Question? getQuestionById(String id) {
    try {
      return questions.firstWhere((question) => question.id == id);
    } catch (e) {
      return null;
    }
  }

  void addAnswer(Answer asnwer) {
    this.answers.add(asnwer);
  }

  void addPlayer(Player player) {
    for (int i = 0; i < players.length; i++) {
      if (players[i].name == player.name) {
        players.removeAt(i);
        players.add(player);
        return;
      }
    }
    this.players.add(player);
  }

  int getScoreInPoint() {
    int pointObtain = 0;
    for (Answer answer in answers) {
      if (answer.isGood()) {
        pointObtain += answer.question.score;
      }
    }
    return pointObtain;
  }

  int getScoreInPercentage() {
    int totalSCore = 0;
    int pointObtain = 0;
    for (Answer answer in answers) {
      totalSCore += answer.question.score;
      if (answer.isGood()) {
        pointObtain += answer.question.score;
      }
    }
    return ((pointObtain / totalSCore) * 100).toInt();
  }
}
