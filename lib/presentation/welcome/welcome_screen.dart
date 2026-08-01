import 'package:binf_educational_app_redone/presentation/dashboard/dashboard_screen.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/profile_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends ConsumerWidget{
 const WelcomeScreen({super.key});

 @override
 Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(startupProfileProvider);
    final appColors = context.appColors;
    //final moleculesAsync = ref.watch(filteredMoleculesStreamProvider);

    /*WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(activeFilterProvider.notifier).updateFilter(
        (current) => current.copyWith(pubChemId: "2244"),
      );
    });*/

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ?appColors.secondaryColor,
            ?appColors.primaryColor,
          ]
        )
      ),
      child: Scaffold(
            appBar: AppBar(
            backgroundColor: appColors.secondaryColor,
            flexibleSpace: Container(
                decoration: BoxDecoration(
                  color: appColors.welcomeScreenContainerColors?.withValues(alpha: 0.5)
                ),
              )
            ),
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
            body: profileAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error:(error, stackTrace) => Center(child: Text('Initialization Fault: $error')),
              data: (userProfile) {
                final bool isReturningUser = userProfile != null;
                return Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: appColors.welcomeScreenContainerColors?.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32))
                        ),
                        child: Text(
                          isReturningUser ?
                          "Welcome Back, ${userProfile.username}!" :
                          "Welcome New User!",
                          key: Key('welcome_title_text'),
                          style: GoogleFonts.inter(
                            color: Color.fromRGBO(246, 252, 253, 1),
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: Image.asset(
                          "assets/img/Bioinformatics Computer Sprite 256.png",
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: appColors.welcomeScreenContainerColors?.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.only(topRight: Radius.circular(32))
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 48, right: 48),
                            child: Column(
                              spacing: 40,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "Become a Bioinformatician!",
                                    style: GoogleFonts.inter(
                                    color: Color.fromRGBO(246, 252, 253, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold                              
                                  ),
                                ),
                                Text(
                                  "This app is meant to help beginners understand how to use and apply bioinformatics tools and techniques for biomedical research",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    color: Color.fromRGBO(246, 252, 253, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600                                
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: appColors.primaryColor,
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                                  child: InkWell(
                                    key: Key("welcome_go_to_dashboard_button"),
                                    onTap: () async {          
                                      if (context.mounted) { 
                                        Navigator.pushReplacement(
                                          context, 
                                          MaterialPageRoute(
                                            builder: (context) => DashboardScreen()
                                          )
                                        );
                                      }
                                    }, 
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          isReturningUser ? 'Resume Learning' : 'Start Learning',
                                          key: Key("welcome_button_text"),
                                          style: GoogleFonts.inter(
                                            color: appColors.textColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            ),
            bottomNavigationBar: Container(
              color: appColors.welcomeScreenContainerColors?.withValues(alpha: 0.7),
              child: SafeArea(
                  child: Container(
                  height: 1,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                  ),
                ),
              ),
            ),
          ),
    );
  }
}