class PlayerAnswer {
  final String id;
  final String questionId;
  final String answerId;
  final bool isCorrect;
  final DateTime timeStamp;

  PlayerAnswer({
    required this.id,
    required this.questionId,
    required this.answerId,
    required this.isCorrect,
    required this.timeStamp,
  });
}