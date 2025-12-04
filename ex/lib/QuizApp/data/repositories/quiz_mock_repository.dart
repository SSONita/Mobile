import '../../model/quiz.dart';
import '../../model/question.dart';
import '../../model/answer.dart';

class QuizMockRepository {
  Quiz loadQuiz() {
    return Quiz(
      id: "quiz1",
      name: "Sample Quiz",
      questions: [
        Question(
          id: "q1",
          title: "What is the capital of France?",
          correctAnswer: "a1",
          answers: [
            Answer(id: "a1", answerChoice: "Paris"),
            Answer(id: "a2", answerChoice: "London"),
            Answer(id: "a3", answerChoice: "Berlin"),
          ],
        ),
        Question(
          id: "q2",
          title: "Which planet is known as the Red Planet?",
          correctAnswer: "a2",
          answers: [
            Answer(id: "a1", answerChoice: "Earth"),
            Answer(id: "a2", answerChoice: "Mars"),
            Answer(id: "a3", answerChoice: "Jupiter"),
          ],
        ),
        Question(
          id: "q3",
          title: "Who is the mazer of group 4?",
          correctAnswer: "a1",
          answers: [
            Answer(id: "a1", answerChoice: "Pich"),
            Answer(id: "a2", answerChoice: "Nika"),
            Answer(id: "a3", answerChoice: "IDK"),
          ],
        ),
        Question(
          id: "q4",
          title: "what is 2 + 2?",
          correctAnswer: "a3",
          answers: [
            Answer(id: "a1", answerChoice: "1"),
            Answer(id: "a2", answerChoice: "8"),
            Answer(id: "a3", answerChoice: "4"),
          ],
        ),
      ],
    );
  }
}
