import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
import 'package:binf_educational_app_redone/data/local/isar_service.dart';
import 'package:binf_educational_app_redone/data/repositories/user_profile_repository.dart';
import 'package:binf_educational_app_redone/presentation/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await IsarService().init();

  final userProfile = await UserProfileRepository().fetchProfile();  

  runApp(MainApp(userProfile: userProfile));
}

class MainApp extends StatelessWidget {
  final UserProfileCollection? userProfile;
  
  const MainApp({super.key, this.userProfile});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bioinformatics Educational App Welcome",
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(userProfile: userProfile),
    );
  }
}
