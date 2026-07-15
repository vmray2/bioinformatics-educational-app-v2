import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey[50],
    primaryColor: Colors.teal,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      AppColors(
        primaryColor: Color.fromRGBO(79, 178, 191, 1),
        secondaryColor: Color.fromRGBO(138, 158, 244, 1),
        tertiaryColor: Color.fromRGBO(188, 126, 204, 1),
        textColor: Color.fromRGBO(2, 9, 10, 1),
        linkTextColor: Color.fromRGBO(88, 97, 255, 1),
        backgroundColor: Color.fromRGBO(235, 236, 237, 1),
        standardCardBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
        moduleCardBackgroundColor: Color.fromRGBO(157, 215, 218, 1),
        activityCardBackgroundColor: Color.fromRGBO(173, 202, 232, 1),
        badgeCardBackgroundColor: Color.fromRGBO(243, 243, 243, 1), 
        welcomeScreenContainerColors: Color.fromRGBO(112, 51, 128, 1)
      ),
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F1F1F),
      foregroundColor: Colors.white,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      AppColors(
        primaryColor: Color.fromRGBO(64, 163, 176, 1),
        secondaryColor: Color.fromRGBO(11, 30, 117, 1),
        tertiaryColor: Color.fromRGBO(141, 71, 159, 1), 
        textColor: Color.fromRGBO(246, 252, 253, 1),
        linkTextColor: Color.fromRGBO(138, 158, 244, 1), 
        backgroundColor: Color.fromRGBO(17, 18, 19, 1), 
        standardCardBackgroundColor: Color.fromRGBO(43, 42, 42, 1),
        moduleCardBackgroundColor: Color.fromRGBO(55, 131, 141, 1),
        activityCardBackgroundColor: Color.fromRGBO(8, 20, 75, 1), 
        badgeCardBackgroundColor: Color.fromRGBO(61, 61, 61, 1), 
        welcomeScreenContainerColors: Color.fromRGBO(112, 51, 128, 1)
      ),
    ],
  );
}