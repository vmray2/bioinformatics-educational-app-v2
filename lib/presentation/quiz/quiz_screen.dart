import 'package:binf_educational_app_redone/presentation/providers/quiz_provider.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/custom_radio_button.dart';
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
                                        padding: const EdgeInsets.all(12.0),
                                        child: CustomRadioButton(answerText: "answerText")
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

                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: appColors.primaryColor,
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Center(
                                child: Text(
                                  "Submit",
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