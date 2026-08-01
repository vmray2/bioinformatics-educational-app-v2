import 'package:binf_educational_app_redone/providers/quiz_provider.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/custom_radio_group.dart';
//import 'package:binf_educational_app_redone/presentation/providers/user_progress_provider.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends ConsumerStatefulWidget {
  final String quizId;
  
  const QuizScreen({super.key, required this.quizId});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> with SingleTickerProviderStateMixin{
  int questionIndex = 0;
  dynamic answerIndex;
  int submittedCorrectAnswer = 0; 
  bool newQuestion = false;
  List<dynamic> incorrectAnswers = [];
  List<double> questionScores = [];

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    final quizAsync = ref.watch(quizByIdProvider(widget.quizId));

    //final userProgress = ref.watch(userProgressProvider);
    
    return quizAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => Scaffold(body: Center(child: Text('Data error: $err'))),
      data: (quiz) {
        return Scaffold(
          backgroundColor: appColors.backgroundColor,
          appBar: AppBar(
            title: Column(
              //spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Module ${quiz.moduleId.split("_")[1]} Quiz",
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    color: appColors.textColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50), 
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Question ${questionIndex + 1} of ${quiz.quizQuestions.length}",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: appColors.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromRGBO(194, 194, 194, 1), width: 1),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: LinearProgressIndicator(
                        value: (questionIndex + 1) / quiz.quizQuestions.length,
                        backgroundColor: Color.fromRGBO(249, 248, 248, 1),
                        color: appColors.tertiaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: appColors.secondaryColor,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    ?appColors.primaryColor,
                    ?appColors.secondaryColor
                  ]
                ),  
                //borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20), bottomRight: Radius.circular(20))        
              ),
            )
          ), 
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 16,
                      children: [
                        Flexible(
                          flex: 26,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: appColors.standardCardBackgroundColor,
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05), 
                                  spreadRadius: 2,                    
                                  blurRadius: 4,                      
                                  offset: const Offset(0, 4),  
                                )
                              ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                spacing: 8,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Question ${questionIndex + 1}",
                                      style: GoogleFonts.inter(
                                        color: appColors.textColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 8,
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: appColors.badgeCardBackgroundColor,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                          quiz.quizQuestions[questionIndex].question,
                                          style: GoogleFonts.inter(
                                            color: appColors.textColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      )
                                    ),
  
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 47,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: appColors.standardCardBackgroundColor,
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05), 
                                  spreadRadius: 2,                    
                                  blurRadius: 4,                      
                                  offset: const Offset(0, 4),  
                                )
                              ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                spacing: 8,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Select One",
                                      style: GoogleFonts.inter(
                                        color: appColors.textColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 8,
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: appColors.badgeCardBackgroundColor,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: CustomRadioGroup(
                                          quizQuestion: quiz.quizQuestions[questionIndex],
                                          newQuestion: newQuestion,
                                          incorrectAnswers: incorrectAnswers,
                                          submittedCorrectAnswer: submittedCorrectAnswer,
                                          onIndexChanged:(value) {
                                            print("Answer index changed to $value");
                                            setState(() {
                                              answerIndex = value;
                                              newQuestion = false;
                                            });
                                          } ,
                                        )
                                      )
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          //fit: FlexFit.loose,
                          child: InkWell(
                            onTap: () {
                              if (answerIndex != null) {
                                if (submittedCorrectAnswer != 2) {
                                  if (quiz.quizQuestions[questionIndex].answers[answerIndex] == quiz.quizQuestions[questionIndex].correctAnswer) {
                                    setState(() {
                                      submittedCorrectAnswer = 2;
                                    });
                                  }
                                  else {
                                    setState(() {
                                      submittedCorrectAnswer = 1;
                                      !incorrectAnswers.contains(quiz.quizQuestions[questionIndex].answers[answerIndex]) ? incorrectAnswers.add(quiz.quizQuestions[questionIndex].answers[answerIndex]) : incorrectAnswers = incorrectAnswers;
                                    });
                                  }
                                }
                                else {
                                  if (questionIndex + 1 < quiz.quizQuestions.length) {
                                    double questionScore = 1 - 0.25 * incorrectAnswers.length;
                                    setState(() {
                                      questionIndex += 1;
                                      answerIndex = null;
                                      submittedCorrectAnswer = 0;
                                      newQuestion = true;
                                      incorrectAnswers = [];
                                      questionScores.add(questionScore);
                                    });
                                  }
                                  else {
                                    // Navigate to Quiz Results Screen
                                    double questionScore = 1 - 0.25 * incorrectAnswers.length;
                                    questionScores.add(questionScore);
                                    print("Quiz Results Screen");
                                    double finalScore = questionScores.fold(0, (sum, element) => sum + element);
                                    finalScore = finalScore / quiz.quizQuestions.length;
                                    print("Question Scores $questionScores");
                                    print("Final Score: $finalScore");
                                  }
                                }
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: appColors.primaryColor,
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Center(
                                child: Text(
                                  submittedCorrectAnswer == 2 ? "Next" : "Submit",
                                  style: GoogleFonts.inter(
                                    color: appColors.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                )
              ],
            )
          ),
        );
      }
    );
  }
  
}