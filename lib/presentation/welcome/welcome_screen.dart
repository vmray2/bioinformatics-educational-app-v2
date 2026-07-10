import 'package:binf_educational_app_redone/data/repositories/user_profile_repository.dart';
import 'package:binf_educational_app_redone/presentation/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/local/collections/user_profile_collection.dart';
import '../providers/profile_provider.dart';

class WelcomeScreen extends ConsumerWidget{
 final UserProfileCollection? userProfile;

 const WelcomeScreen({super.key, this.userProfile});

 @override
 Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(startupProfileProvider);

    return Scaffold(
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:(error, stackTrace) => Center(child: Text('Initialization Fault: $error')),
        data: (userProfile) {
          final bool isReturningUser = userProfile != null;

          return Center(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isReturningUser ?
                    "Welcome Back, ${userProfile.username}!" :
                    "Welcome New User!",
                    key: Key('welcome_title_text'),
                  ),
                  ElevatedButton(
                    key: Key("welcome_go_to_dashboard_button"),
                    onPressed: () async {
                      UserProfileCollection activeProfile;

                      if (isReturningUser) {
                        activeProfile = userProfile;
                      }
                      else {
                        activeProfile = await UserProfileRepository().createProfile();
                      }

                      if (context.mounted) { 
                        Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => DashboardScreen(userProfile: activeProfile)
                          )
                        );
                      }
                    }, 
                    child: Text(
                      isReturningUser ? 'Resume Learning' : 'Start Learning',
                      key: Key("welcome_button_text")
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ) 
    );
  }
}