import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
import 'package:binf_educational_app_redone/presentation/providers/curriculum_provider.dart';
import 'package:binf_educational_app_redone/presentation/providers/user_progress_provider.dart';
import 'package:binf_educational_app_redone/presentation/shared_widgets/module_card.dart';
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
    final unlockedIds = ref.watch(unlockedModulesProvider);
    final appColors = context.appColors;

    return Scaffold(
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
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                children: [
                  Expanded(
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
                          children: [
                            Text(
                              "Progress"
                            ),
                            Text(
                              "Level ${userProfile!.currentLevel}: ${userProfile!.userTitle}"
                            ),
                            LinearProgressIndicator(
                              value: userProfile!.totalXp / userProfile!.xpForCompletion,
                              backgroundColor: Color.fromRGBO(194, 194, 194, 1),
                              color: appColors.tertiaryColor,
                              minHeight: 6,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Badges"
                                ),
                                Text(
                                  "View All >"
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
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
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Modules"),
                                  Text("View All >")
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: SizedBox(
                                child: curriculumAsync.when(
                                  data: (curriculum) => ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: curriculum.modules.length,
                                    itemBuilder: (context, index) {
                                      final module = curriculum.modules[index];
                                      final isLocked = !unlockedIds.contains(module.moduleId);
                                      return ModuleCard(
                                        module: module,
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
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
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Activities"),
                                  Text("View All >")
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: SizedBox(
                                child: curriculumAsync.when(
                                  data: (curriculum) => ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: curriculum.modules.length,
                                    itemBuilder: (context, index) {
                                      final module = curriculum.modules[index];
                                      final isLocked = !unlockedIds.contains(module.moduleId);
                                      return ModuleCard(
                                        module: module,
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
        ),
      ),
    );
  }
}