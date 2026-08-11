import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityObjectiveBar extends StatelessWidget{
  final String objectiveText;

  const ActivityObjectiveBar({super.key, required this.objectiveText});

  @override
  Widget build(BuildContext context) {
      final appColors = context.appColors;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: appColors.standardCardBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(204, 204, 204, 1),
            width: 1.0
          )
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Flexible(
            flex: 3,
            child: Text(
              "Objective",
              style: GoogleFonts.inter(
                fontSize: 12,
                color: appColors.textColor,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Text(
              objectiveText,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: appColors.textColor
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}