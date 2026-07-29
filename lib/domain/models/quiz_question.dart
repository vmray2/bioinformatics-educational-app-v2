class QuizQuestion {
  final String quizQuestionId;
  final String quizId;
  final String question;
  final List<dynamic> answers;
  final String correctAnswer;

  QuizQuestion ({
    required this.quizQuestionId,
    required this.quizId,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      quizQuestionId: json["quizQuestionId"] as String, 
      quizId: json["quizId"] as String, 
      question: json["question"] as String, 
      answers: json["answers"] as List<dynamic>, 
      correctAnswer: json["correctAnswer"] as String, 
    );
  }
}