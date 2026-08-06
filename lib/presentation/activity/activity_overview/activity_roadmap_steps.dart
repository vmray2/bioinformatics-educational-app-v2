import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityRoadmapSteps extends ConsumerStatefulWidget {
  final List<dynamic> instructions;
  
  const ActivityRoadmapSteps({super.key, required this.instructions});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActivityRoadmapStepsState();
}

class _ActivityRoadmapStepsState extends ConsumerState<ActivityRoadmapSteps> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {    
    final appColors = context.appColors;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: appColors.badgeCardBackgroundColor,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < widget.instructions.length - 1) {
              setState(() {
                _currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          steps: [
            for (int i = 0; i < widget.instructions.length; i++) ... [
              Step(
                title: Text(
                  "Step ${i+1}",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: appColors.textColor
                  ),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.instructions[i],
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: appColors.textColor
                      ),
                    )
                  ],
                )
              )
            ]
          ],
        ),
      ),
    );
  }
}