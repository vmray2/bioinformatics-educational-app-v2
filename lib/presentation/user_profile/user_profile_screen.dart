//import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
//import 'package:binf_educational_app_redone/domain/models/user_progress.dart';
//import 'package:binf_educational_app_redone/presentation/providers/activity_provider.dart';
import 'package:binf_educational_app_redone/presentation/providers/badge_provider.dart';
import 'package:binf_educational_app_redone/presentation/providers/competency_provider.dart';
//import 'package:binf_educational_app_redone/presentation/providers/curriculum_provider.dart';
import 'package:binf_educational_app_redone/presentation/providers/profile_provider.dart';
import 'package:binf_educational_app_redone/presentation/providers/user_progress_provider.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/badge_card.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfileScreen extends ConsumerWidget{
  const UserProfileScreen({super.key});
  


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProgress = ref.watch(userProgressProvider);
    final userProfileAsync = ref.watch(startupProfileProvider);

    //final modulesAsync = ref.watch(curriculumProvider);
    //final activitiesAsync = ref.watch(activitiesProvider);
    final badgesAsync = ref.watch(badgesProvider);
    final competenciesAsync = ref.watch(competenciesProvider);

    final completedModulesCount = userProgress.moduleMetrics.values
          .where((metric) => metric.isCompleted)
          .length;

    final completedActivitiesCount = userProgress.activityMetrics.values
          .where((metric) => metric.isCompleted)
          .length;

    /*final completedCompetenciesCount = userProgress.competencyMetrics.values
          .where((metric) => metric.isCompleted)
          .length;*/

    final totalUnlockedBadges = userProgress.unlockedBadgeIds.length;

    final appColors = context.appColors;
    
    print(userProgress.competencyMetrics);

    return Scaffold(
        backgroundColor: appColors.backgroundColor,
        appBar: AppBar(
            title: Text(
              "User Profile",
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
      body: userProfileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:(error, stackTrace) => Center(child: Text('Initialization Fault: $error')),
        data: (userProfile) {
          return SafeArea(
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 16,
                      children: [
                        Flexible(
                          flex: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              color: appColors.standardCardBackgroundColor,
                              borderRadius: BorderRadius.circular(8),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Image.asset(
                                          userProfile!.profileImgPath,
                                          //width: 300,
                                          //height: 300,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          spacing: 4,
                                          children: [
                                            Text(
                                              userProfile.username,
                                              style: GoogleFonts.inter(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                                color: appColors.textColor
                                              ),
                                            ),
                                            Text(
                                              "Title: ${userProfile.userTitle}",
                                              style: GoogleFonts.inter(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: appColors.textColor
                                              ),
                                            ),
                                            Row(
                                              spacing: 8,
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      color: appColors.badgeCardBackgroundColor
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        spacing: 4,
                                                        children: [
                                                          Text(
                                                            "$completedModulesCount/9",
                                                            style: GoogleFonts.inter(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600,
                                                              color: appColors.textColor
                                                            ),
                                                          ),
                                                          Text(
                                                            "Modules Completed",
                                                            textAlign: TextAlign.center,
                                                            style: GoogleFonts.inter(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w600,
                                                              color: appColors.textColor
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      color: appColors.badgeCardBackgroundColor
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        spacing: 4,
                                                        children: [
                                                          Text(
                                                            "$completedActivitiesCount/7",
                                                            style: GoogleFonts.inter(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600,
                                                              color: appColors.textColor
                                                            ),
                                                          ),
                                                          Text(
                                                            "Activities Completed",
                                                            textAlign: TextAlign.center,
                                                            style: GoogleFonts.inter(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w600,
                                                              color: appColors.textColor
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                              
                                    ],
                                  ),
                                  Text(
                                    "Level ${userProgress.userMetrics.currentLevel}: ${userProfile.userTitle}",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color.fromRGBO(194, 194, 194, 1), width: 1),
                                      borderRadius: BorderRadius.circular(16)
                                    ),
                                    child: LinearProgressIndicator(
                                      value: userProgress.userMetrics.totalXp! / userProgress.userMetrics.xpForCompletion!,
                                      backgroundColor: Color.fromRGBO(249, 248, 248, 1),
                                      color: appColors.tertiaryColor,
                                      minHeight: 16,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  Row(
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
                                  Flexible(
                                    child: badgesAsync.when(
                                      data: (badges) => ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: badges.length,
                                        itemBuilder: (context, index) {
                                          final badge = badges[index];
                                          final isLocked = !userProgress.unlockedBadgeIds.contains(badge.badgeId);
                                          return BadgeCard(
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
                          flex: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              color: appColors.standardCardBackgroundColor,
                              borderRadius: BorderRadius.circular(8),
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
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Competencies",
                                        style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: appColors.textColor
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
                                  Flexible(
                                    child: competenciesAsync.when(
                                      data: (competencies) => ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: competencies.length,
                                        itemBuilder: (context, index) {
                                          final competency = competencies[index];
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 100,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: appColors.badgeCardBackgroundColor
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  spacing: 8,
                                                  children: [
                                                    Stack(
                                                      alignment: Alignment.center,
                                                      children: [
                                                        SizedBox(
                                                          //width: 30,
                                                          //height: 30,
                                                          child: CircularProgressIndicator(
                                                            value: userProgress.getCompetency(competency.competencyId).totalXp! / competency.xpForCompletion,
                                                            color: appColors.tertiaryColor,
                                                            backgroundColor: Color.fromRGBO(180, 180, 180, 1),
                                                          ),
                                                        ),
                                                        Text(
                                                          "${userProgress.getCompetency(competency.competencyId).totalXp! / competency.xpForCompletion}%",
                                                          textAlign: TextAlign.center,
                                                          style: GoogleFonts.inter(
                                                            fontSize: 10,
                                                            fontWeight: FontWeight.bold
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Text(
                                                      competency.name,
                                                      textAlign: TextAlign.center,
                                                      style: GoogleFonts.inter(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.bold
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
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
                                  )
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
          );
        }
      ), 
      bottomNavigationBar:  Container(
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
  }}