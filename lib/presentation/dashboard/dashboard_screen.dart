import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
import 'package:binf_educational_app_redone/domain/models/module_step.dart';
import 'package:binf_educational_app_redone/presentation/activity/activity_overview_screen.dart';
import 'package:binf_educational_app_redone/presentation/module/module_overview_screen.dart';
import 'package:binf_educational_app_redone/presentation/providers/curriculum_provider.dart';
import 'package:binf_educational_app_redone/presentation/providers/activity_provider.dart';
import 'package:binf_educational_app_redone/presentation/providers/badge_provider.dart';
import 'package:binf_educational_app_redone/presentation/providers/user_progress_provider.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/activity_card.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/badge_card.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/module_card.dart';
import 'package:binf_educational_app_redone/presentation/user_profile/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends ConsumerWidget{
 final UserProfileCollection? userProfile;

 const DashboardScreen({super.key, this.userProfile});

@override
  Widget build(BuildContext context, WidgetRef ref) {
    final curriculumAsync = ref.watch(curriculumProvider);
    final activitiesAsync = ref.watch(activitiesProvider);
    final badgesAsync = ref.watch(badgesProvider);
    final userProgress = ref.watch(userProgressProvider);
    
    final totalUnlockedBadges = userProgress.unlockedBadgeIds.length;

    final appColors = context.appColors;

    return Scaffold(
      backgroundColor: appColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Your Dashboard",
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
      body: Column(
        children: [
          Flexible(
            flex: 100,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                children: [
                  Flexible(
                    flex: 28,
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
                          //spacing: 8,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 0),
                                child: Text(
                                  "Progress",
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                            Flexible(flex: 2, child: SizedBox(height: 50,)),
                            Flexible(
                              flex: 2,
                              child: Text(
                                "Level ${userProgress.userMetrics.currentLevel}: ${userProfile!.userTitle}",
                                key: Key("dashboard_user_level_and_title"),
                                textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            Flexible(flex: 1, child: SizedBox(height: 50,)),
                            Flexible(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color.fromRGBO(194, 194, 194, 1), width: 1),
                                  borderRadius: BorderRadius.circular(16)
                                ),
                                child: LinearProgressIndicator(
                                  key: Key("dashboard_user_xp_bar"),
                                  value: userProgress.userMetrics.totalXp! / userProgress.userMetrics.xpForCompletion!,
                                  backgroundColor: Color.fromRGBO(249, 248, 248, 1),
                                  color: appColors.tertiaryColor,
                                  minHeight: 16,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                            Flexible(flex: 2, child: SizedBox(height: 50,)),
                            Flexible(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    spacing: 4,
                                    children: [
                                      Text(
                                        "Badges",
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          height: 1
                                        ),
                                      ),
                                      Text(
                                        "$totalUnlockedBadges/20",
                                        key: Key("dashboard_num_badges_unlocked"),
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: appColors.textColor?.withValues(alpha: 0.7)
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "View All >",
                                    style: GoogleFonts.inter(
                                      color: appColors.linkTextColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Flexible(flex: 1, child: SizedBox(height: 5,)),
                            Flexible(
                              flex: 9,
                              child: badgesAsync.when(
                                data: (badges) => ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: badges.length,
                                  itemBuilder: (context, index) {
                                    final badge = badges[index];
                                    final isLocked = !userProgress.unlockedBadgeIds.contains(badge.badgeId);
                                    return BadgeCard(
                                      key: Key("dashboard_badge_card_${badge.badgeId}"),
                                      badge: badge,
                                      isLocked: isLocked,
                                      onTap: () {
                                                            
                                      },
                                    );
                                  },
                                ),
                                
                                loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                
                                error: (err, stack) => Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    key: const Key('error_state'),
                                    child: Text('Error loading curriculum data: $err'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 25,
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
                          spacing: 8,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Modules",
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    "View All >",
                                    style: GoogleFonts.inter(
                                      color: appColors.linkTextColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 18,
                              child: SizedBox(
                                child: curriculumAsync.when(
                                  data: (curriculum) => ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: curriculum.modules.length,
                                    itemBuilder: (context, index) {
                                      final module = curriculum.modules[index];
                                      final isLocked = !userProgress.unlockedModuleIds.contains(module.moduleId);
                                      int? status = userProgress.moduleMetrics[module.moduleId]?.status;
                                      status = 0;
                                      int totalModuleStepsCompleted = 0;
                                      for (ModuleStep moduleStep in module.moduleSteps) {
                                        if (userProgress.moduleStepMetrics[moduleStep.moduleStepId] != null) {
                                          if (userProgress.moduleStepMetrics[moduleStep.moduleStepId]!.isCompleted) {
                                            totalModuleStepsCompleted += 1;
                                          }                                        
                                        }
                                      }
                                      //totalModuleStepsCompleted = 2;
                                      return ModuleCard(
                                        module: module,
                                        totalModuleStepsCompleted: totalModuleStepsCompleted,
                                        isLocked: isLocked,
                                        status: status,
                                        key: Key("dashboard_module_card_${module.moduleId}"),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ModuleOverviewScreen(moduleId: module.moduleId)
                                            )
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  
                                  loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  
                                  error: (err, stack) => Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      key: const Key('error_state'),
                                      child: Text('Error loading curriculum data: $err'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 25,
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
                          spacing: 8,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Activities",
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                  Text(
                                    "View All >",
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: appColors.linkTextColor,
                                      fontWeight: FontWeight.w600
                                    )
                                  )
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 18,
                              child: SizedBox(
                                child: activitiesAsync.when(
                                  data: (activities) => ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: activities.length,
                                    itemBuilder: (context, index) {
                                      final activity = activities[index];
                                      final isLocked = !userProgress.unlockedActivityIds.contains(activity.activityId);
                                      bool? isCompleted = userProgress.activityMetrics[activity.activityId]?.isCompleted;
                                      isCompleted ??= false;
                                      
                                      return ActivityCard(
                                        key: Key("dashboard_activity_card_${activity.activityId}"),
                                        activity: activity,
                                        isCompleted: isCompleted,
                                        isLocked: isLocked,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ActivityOverviewScreen(activityId: activity.activityId)
                                            )
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  
                                  loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  
                                  error: (err, stack) => Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      key: const Key('error_state'),
                                      child: Text('Error loading curriculum data: $err'),
                                    ),
                                  ),
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
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              ?appColors.primaryColor,
              ?appColors.secondaryColor,
            ]
          ),
        ),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            selectedFontSize:  14,
            selectedItemColor: Colors.white,
            iconSize: 32,
            unselectedFontSize: 12,
            elevation: 0,
            unselectedItemColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home), 
                label: "Home"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pages), 
                label: "Competencies", 
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person), 
                label: "Profile"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings), 
                label: "Settings"
              )
            ],
            onTap: (value) {
              if (value == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfileScreen()
                  )
                );
              }
            },
        ),
      ),
    );
  }
}