import 'package:binf_educational_app_redone/data/local/isar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:binf_educational_app_redone/presentation/welcome/welcome_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await IsarService().init();

  runApp(
    const ProviderScope(
      child: MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {  
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bioinformatics Educational App Welcome",
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
