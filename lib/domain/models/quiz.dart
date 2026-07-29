import 'package:binf_educational_app_redone/domain/models/quiz_question.dart';

class Quiz {
  final String quizId;
  final String moduleId;
  final List<QuizQuestion> quizQuestions;

  Quiz ({
    required this.moduleId,
    required this.quizId,
    required this.quizQuestions,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      moduleId: json["moduleId"] as String, 
      quizId: json["quizId"] as String, 
      quizQuestions: (json["quizQuestions"] as List<dynamic>)
              .map((m) => QuizQuestion.fromJson(m as Map<String, dynamic>))
              .toList(),
    );
  }
}