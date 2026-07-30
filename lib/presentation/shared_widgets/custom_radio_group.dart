import 'package:binf_educational_app_redone/domain/models/quiz_question.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';

class CustomRadioGroup extends StatefulWidget{
  final QuizQuestion quizQuestion;
  final ValueSetter<int> onIndexChanged;
  final dynamic submittedCorrectAnswer;
  final bool newQuestion;
  final List<dynamic> incorrectAnswers;

  const CustomRadioGroup({
    super.key, 
    required this.quizQuestion, 
    required this.onIndexChanged, 
    required this.newQuestion,
    required this.incorrectAnswers,
    required this.submittedCorrectAnswer
  });

  @override
  State<StatefulWidget> createState() => _CustomRadioGroupState();
}

class _CustomRadioGroupState extends State<CustomRadioGroup> {
  dynamic selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        for (int i = 0; i < widget.quizQuestion.answers.length; i++) ... [
          InkWell(
            onTap: () {
              setState(() {
                selectedIndex = i;
              });

              widget.onIndexChanged(selectedIndex);
            },
            child: CustomRadioButton(
              answerText: widget.quizQuestion.answers[i], 
              isSelected: selectedIndex == i ? true : false, 
              newQuestion: widget.newQuestion,
              incorrectAnswers: widget.incorrectAnswers,
              submittedCorrectAnswer: widget.submittedCorrectAnswer,
              correctAnswer: widget.quizQuestion.correctAnswer,
            )
          )
        ]
      ],
    );
  }

}