import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget{
 final UserProfileCollection? userProfile;

 const DashboardScreen({super.key, this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Dashboard"),
    );
  }
}