import 'package:binf_educational_app_redone/domain/models/activity_config.dart';
import 'package:binf_educational_app_redone/presentation/activity/activity_overview/activity_competencies_list.dart';
import 'package:binf_educational_app_redone/presentation/activity/activity_overview/activity_roadmap_steps.dart';
import 'package:binf_educational_app_redone/presentation/activity/data_hub_query_builder/query_builder_screen.dart';
import 'package:binf_educational_app_redone/providers/activity_provider.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityOverviewScreen extends ConsumerStatefulWidget {
  final String activityId;
  final ActivityConfig? config;
  
  const ActivityOverviewScreen({super.key, required this.activityId, this.config});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActivityOverviewScreenState();
}

class _ActivityOverviewScreenState extends ConsumerState<ActivityOverviewScreen> with SingleTickerProviderStateMixin {
  int selectedSegmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    final activityDetailAsync = ref.watch(activityByIdProvider(widget.activityId));
    //final competenciesAsync = ref.watch(competenciesProvider);
    //final userProgress = ref.watch(userProgressProvider);

    return activityDetailAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => Scaffold(body: Center(child: Text('Data error: $err'))),
      data: (activity) {
        return Scaffold(
          backgroundColor: appColors.backgroundColor,
          appBar: AppBar(
            title: Text(
              "${activity.name} Activity Overview",
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
                                        "${activity.name} Activity",
                                        style: GoogleFonts.inter(
                                          fontSize: 18,
                                          color: appColors.textColor,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        activity.name,
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
                                                          activity.estTime,
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
                                                        child: Text(
                                                          activity.difficulty,
                                                          style: GoogleFonts.inter(
                                                            fontSize: 16,
                                                            color: appColors.textColor,
                                                            fontWeight: FontWeight.w600
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          "Difficulty",
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
                                      activity.description,
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  )
                                ) : 
                                selectedSegmentIndex == 2 ? ActivityRoadmapSteps(instructions: activity.instructions) :
                                selectedSegmentIndex == 1 ? ActivityCompetenciesList(associatedCompetencies: activity.associatedCompetencies) :
                                Container()
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          //fit: FlexFit.loose,
                          child: InkWell(
                            onTap: () {
                              ActivityConfig finalConfig;

                              if (widget.config != null) {
                                finalConfig = widget.config!;
                              }
                              else {
                                // Create or pull an activity configuration
                                finalConfig = ActivityConfig(
                                  activityId: widget.activityId, 
                                  objectives: ["Objective 1", "Objective 2", "Objective 3"],
                                  correctMoleculeId: "GENE_TP53"
                                );
                              }

                              if (widget.activityId == "act_data_hub_query_builder") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QueryBuilderScreen(config: finalConfig, activityName: activity.name,)
                                  )
                                );
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
                                  "Start Activity",
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
            ),
          ),
        );
      }
    );
  }
}