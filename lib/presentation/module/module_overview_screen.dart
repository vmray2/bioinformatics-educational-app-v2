import 'package:binf_educational_app_redone/domain/models/module_step.dart';
import 'package:binf_educational_app_redone/presentation/module/module_competencies_list.dart';
import 'package:binf_educational_app_redone/presentation/module/module_roadmap_steps.dart';
//import 'package:binf_educational_app_redone/presentation/providers/competency_provider.dart';
import 'package:binf_educational_app_redone/presentation/providers/curriculum_provider.dart';
import 'package:binf_educational_app_redone/presentation/providers/user_progress_provider.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ModuleOverviewScreen extends ConsumerStatefulWidget {
  final String moduleId;
  
  const ModuleOverviewScreen({super.key, required this.moduleId});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ModuleOverviewScreenState();
}

class _ModuleOverviewScreenState extends ConsumerState<ModuleOverviewScreen> with SingleTickerProviderStateMixin {
  int selectedSegmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    final moduleDetailAsync = ref.watch(moduleByIdProvider(widget.moduleId));
    //final competenciesAsync = ref.watch(competenciesProvider);
    final userProgress = ref.watch(userProgressProvider);

    return moduleDetailAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => Scaffold(body: Center(child: Text('Data error: $err'))),
      data: (module) {
        int totalModuleStepsCompleted = 0;
        for (ModuleStep moduleStep in module.moduleSteps) {
          if (userProgress.moduleStepMetrics[moduleStep.moduleStepId] != null) {
            if (userProgress.moduleStepMetrics[moduleStep.moduleStepId]!.isCompleted) {
              totalModuleStepsCompleted += 1;
            }                                        
          }
        }
        return Scaffold(
          backgroundColor: appColors.backgroundColor,
          appBar: AppBar(
            title: Text(
              "Module ${widget.moduleId.split("_")[1]} Overview",
              style: GoogleFonts.inter(
                fontSize: 24,
                color: appColors.textColor,
                fontWeight: FontWeight.bold
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
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20), bottomRight: Radius.circular(20))        
              ),
            )
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 100,
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 16,
                      children: [
                        Flexible(
                          flex: 20,
                          //fit: FlexFit.loose,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              //maxHeight: 190
                            ),
                            child: Container(
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
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 16,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "Module ${widget.moduleId.split("_")[1]}",
                                        style: GoogleFonts.inter(
                                          fontSize: 18,
                                          color: appColors.textColor,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        module.moduleName,
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          color: appColors.textColor,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 4,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          spacing: 16,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: appColors.badgeCardBackgroundColor
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(16.0),
                                                child: Center(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    spacing: 8,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          "${module.competenciesXp.values.fold<int>(0, (sum, item) => sum + (item as int))}",
                                                          style: GoogleFonts.inter(
                                                            fontSize: 16,
                                                            color: appColors.textColor,
                                                            fontWeight: FontWeight.w600
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          "Total XP",
                                                          style: GoogleFonts.inter(
                                                            fontSize: 12,
                                                            color: appColors.textColor,
                                                            fontWeight: FontWeight.w600
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: appColors.badgeCardBackgroundColor
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(16.0),
                                                child: Center(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    spacing: 8,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          module.estTime,
                                                          style: GoogleFonts.inter(
                                                            fontSize: 16,
                                                            color: appColors.textColor,
                                                            fontWeight: FontWeight.w600
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          "Est. Time",
                                                          style: GoogleFonts.inter(
                                                            fontSize: 12,
                                                            color: appColors.textColor,
                                                            fontWeight: FontWeight.w600
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: appColors.badgeCardBackgroundColor
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(16.0),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    spacing: 8,
                                                    children: [
                                                      Flexible(
                                                        fit: FlexFit.loose,
                                                        flex: 2,
                                                        child: ConstrainedBox(
                                                          constraints: BoxConstraints(
                                                            maxHeight: 40,
                                                            maxWidth: 40
                                                          ),
                                                          child: Stack(
                                                            alignment: Alignment.center,
                                                            children: [
                                                              SizedBox(
                                                                //width: 30,
                                                                //height: 30,
                                                                child: CircularProgressIndicator(
                                                                  value: totalModuleStepsCompleted / module.moduleSteps.length,
                                                                  color: appColors.tertiaryColor,
                                                                  backgroundColor: Color.fromRGBO(180, 180, 180, 1),
                                                                ),
                                                              ),
                                                              Text(
                                                                "$totalModuleStepsCompleted/${module.moduleSteps.length}",
                                                                style: GoogleFonts.inter(
                                                                  fontSize: 10,
                                                                  fontWeight: FontWeight.bold
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          "Progress",
                                                          style: GoogleFonts.inter(
                                                            fontSize: 12,
                                                            color: appColors.textColor,
                                                            fontWeight: FontWeight.w600
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),                                        
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          //fit: FlexFit.loose,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              //maxHeight: 50
                            ),
                            child: Container(
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
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: SegmentedButton<int>(
                                    showSelectedIcon: false,
                                    style: SegmentedButton.styleFrom(
                                      padding: EdgeInsets.only(left: 6, right: 6),
                                      side: BorderSide.none,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ) 
                                    ),
                                    segments: [
                                      ButtonSegment(
                                        value: 0, 
                                        label: Text(
                                          "Objective", 
                                          style: GoogleFonts.inter(
                                            color: appColors.textColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500
                                          )
                                        )
                                      ),
                                      ButtonSegment(
                                        value: 1, 
                                        label: Text(
                                          "Competency", 
                                          style: GoogleFonts.inter(
                                            color: appColors.textColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500
                                          )
                                        )
                                      ),                                
                                      ButtonSegment(
                                        value: 2, 
                                        label: Text(
                                          "Roadmap", 
                                          style: GoogleFonts.inter(
                                            color: appColors.textColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500
                                          )
                                        )
                                      ),                              
                                    ], 
                                    selected: {selectedSegmentIndex},
                                    onSelectionChanged: (set) => setState(() => selectedSegmentIndex = set.first),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ),
                        Flexible(
                          flex: 40,
                          fit: FlexFit.tight,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              //maxHeight: 348,
                            ),
                            child: Container(
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
                                padding: const EdgeInsets.all(16.0),
                                child: selectedSegmentIndex == 0 ? Container(
                                  decoration: BoxDecoration(
                                    color: appColors.badgeCardBackgroundColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      module.description,
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  )
                                ) : 
                                selectedSegmentIndex == 2 ? ModuleRoadmapSteps(moduleSteps: module.moduleSteps) :
                                selectedSegmentIndex == 1 ? ModuleCompetenciesList(competencyXp: module.competenciesXp) :
                                Container()
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          //fit: FlexFit.loose,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                //maxHeight: 50
                              ),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: appColors.primaryColor,
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                ),
                                child: Center(
                                  child: Text(
                                    userProgress.moduleMetrics[module.moduleId]?.status == 0 ? "Start Module" : "Resume Module",
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
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
        );
      }
    );
  }
}