import 'package:binf_educational_app_redone/theme/app_theme.dart';
import 'package:binf_educational_app_redone/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:binf_educational_app_redone/presentation/welcome/welcome_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MainApp(),
    )
  );
}

class MainApp extends ConsumerWidget {  
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      title: "Bioinformatics Educational App Welcome",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
