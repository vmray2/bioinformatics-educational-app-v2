import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';

class StandardCard extends StatelessWidget{
  final Widget cardChild;

  const StandardCard({super.key, required this.cardChild});

  @override
  Widget build(BuildContext context) {
      final appColors = context.appColors;

    return Container(
      width: double.infinity,
      height: double.infinity,
      //padding: EdgeInsets.all(16),
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
      child: cardChild,
    );
  }
  
}