class Quiz {
  List<Answer> _answers = [];
  void addAnswer(Answer answer) {
    _answers.add(answer);
  }

  int getScore() {
    return _answers.where((a) => a.isGoodAnswer).length;
  }
}

class Question {
  String title;
  List<String> choices;
  String goodChoice;

  Question({
    required this.title,
    required this.choices,
    required this.goodChoice,
  });
}

class Answer {
  String answerChoice;
  bool isGoodAnswer;
  Question question;

  Answer({required this.answerChoice, required this.question})
    : isGoodAnswer = answerChoice == question.goodChoice;
}

void main() {
  Question q1 = Question(
    title: 'What is the capital of Cambodia?',
    choices: ['Phnom Penh', 'Siem Reap', 'Svay Reing'],
    goodChoice: 'Phnom Penh',
  );
  Question q2 = Question(
    title: '2 + 2 = ?',
    choices: ['3', '4', '1'],
    goodChoice: '4',
  );
  Quiz quiz = Quiz();
  quiz.addAnswer(Answer(answerChoice: "Phnom Penh", question: q1));
  quiz.addAnswer(Answer(answerChoice: "Siem Reap", question: q1));

  quiz.addAnswer(Answer(answerChoice: "4", question: q2));
  quiz.addAnswer(Answer(answerChoice: "1", question: q2));

  print("Score: ${quiz.getScore()}");
}
