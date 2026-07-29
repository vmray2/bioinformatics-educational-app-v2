import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// ignore: must_be_immutable
class CustomRadioButton extends StatefulWidget{
  final String answerText;
  
  const CustomRadioButton({
    super.key, 
    required this.answerText,
  });

  @override
  State<StatefulWidget> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: appColors.tertiaryColor!,
              width: 4
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: Icon(
                Icons.circle, 
                color: appColors.tertiaryColor, 
                size: 15
              ) ,
            ),
          ),
        ),
        Text(
          widget.answerText,
          style: GoogleFonts.inter(

          ),
        )
      ],
    );
  }
  
}