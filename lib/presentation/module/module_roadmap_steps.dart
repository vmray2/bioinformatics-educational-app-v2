import 'package:binf_educational_app_redone/domain/models/module_step.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ModuleRoadmapSteps extends ConsumerStatefulWidget {
  final List<dynamic> moduleSteps;
  
  const ModuleRoadmapSteps({super.key, required this.moduleSteps});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ModuleRoadmapStepsState();
}

class _ModuleRoadmapStepsState extends ConsumerState<ModuleRoadmapSteps> {
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
            if (_currentStep < widget.moduleSteps.length - 1) {
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
            for (ModuleStep moduleStep in widget.moduleSteps) ... [
              Step(
                title: Text(
                  moduleStep.title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: appColors.textColor
                  ),
                ), 
                subtitle: Text(
                  moduleStep.estTime,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    color: appColors.textColor
                  ),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      moduleStep.description,
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