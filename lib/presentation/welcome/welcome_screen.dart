import 'package:binf_educational_app_redone/data/repositories/user_profile_repository.dart';
import 'package:binf_educational_app_redone/presentation/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import '../../data/local/collections/user_profile_collection.dart';

class WelcomeScreen extends StatelessWidget{
 final UserProfileCollection? userProfile;

 const WelcomeScreen({super.key, this.userProfile});

 @override
 Widget build(BuildContext context) {
    final bool isReturningUser = userProfile != null;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isReturningUser ?
                "Welcome Back, ${userProfile!.username}!" :
                "Welcome New User!"
              ),
              ElevatedButton(
                onPressed: () async {
                  UserProfileCollection activeProfile;

                  if (isReturningUser) {
                    activeProfile = userProfile!;
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
                  isReturningUser ? 'Resume Learning' : 'Start Learning'
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}