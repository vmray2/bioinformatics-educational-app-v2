import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// ignore: must_be_immutable
class CustomRadioButton extends StatefulWidget{
  final String answerText;
  final bool isSelected;
  final bool newQuestion;
  final List<dynamic> incorrectAnswers;
  final dynamic submittedCorrectAnswer;
  final dynamic correctAnswer;
  
  const CustomRadioButton({
    super.key, 
    required this.answerText, 
    required this.isSelected,
    required this.newQuestion, 
    required this.incorrectAnswers, 
    required this.submittedCorrectAnswer, 
    required this.correctAnswer,
  });

  @override
  State<StatefulWidget> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 40,
                  maxWidth: 40
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.isSelected && widget.newQuestion == false ? appColors.tertiaryColor! : Color.fromRGBO(121, 121, 121, 1),
                      width: 3
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Icon(
                        Icons.circle, 
                        color: widget.isSelected && widget.newQuestion == false ? appColors.tertiaryColor! : Color.fromRGBO(121, 121, 121, 0), 
                        //size: 15
                      ) ,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Text(
                widget.answerText,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: widget.incorrectAnswers.contains(widget.answerText) ? Colors.red
                         : widget.submittedCorrectAnswer == 2 && widget.answerText == widget.correctAnswer ? Colors.green
                         : appColors.textColor
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
  
}