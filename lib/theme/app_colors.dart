import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? tertiaryColor;
  final Color? textColor;
  final Color? linkTextColor;
  final Color? backgroundColor;
  final Color? standardCardBackgroundColor;
  final Color? moduleCardBackgroundColor;
  final Color? activityCardBackgroundColor;
  final Color? badgeCardBackgroundColor;
  final Color? welcomeScreenContainerColors;
  //color for incorrect answer
  //color for correct answer
  //color for radio button



  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.textColor,
    required this.linkTextColor,
    required this.backgroundColor,
    required this.standardCardBackgroundColor,
    required this.moduleCardBackgroundColor,
    required this.activityCardBackgroundColor,
    required this.badgeCardBackgroundColor,
    required this.welcomeScreenContainerColors,
  });

  @override
  AppColors copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? textColor,
    Color? linkTextColor,
    Color? backgroundColor,
    Color? standardCardBackgroundColor,
    Color? moduleCardBackgroundColor,
    Color? activityCardBackgroundColor,
    Color? badgeCardBackgroundColor,
    Color? welcomeScreenContainerColors,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      textColor: textColor ?? this.textColor,
      linkTextColor: linkTextColor ?? this.linkTextColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      standardCardBackgroundColor: standardCardBackgroundColor ?? this.standardCardBackgroundColor,
      moduleCardBackgroundColor: moduleCardBackgroundColor ?? this.moduleCardBackgroundColor,
      activityCardBackgroundColor: activityCardBackgroundColor ?? this.activityCardBackgroundColor,
      badgeCardBackgroundColor: badgeCardBackgroundColor ?? this.badgeCardBackgroundColor,
      welcomeScreenContainerColors: welcomeScreenContainerColors ?? this.welcomeScreenContainerColors,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      linkTextColor: Color.lerp(linkTextColor, other.linkTextColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      standardCardBackgroundColor: Color.lerp(standardCardBackgroundColor, other.standardCardBackgroundColor, t),
      moduleCardBackgroundColor: Color.lerp(moduleCardBackgroundColor, other.moduleCardBackgroundColor, t),
      activityCardBackgroundColor: Color.lerp(activityCardBackgroundColor, other.activityCardBackgroundColor, t),
      badgeCardBackgroundColor: Color.lerp(badgeCardBackgroundColor, other.badgeCardBackgroundColor, t),
      welcomeScreenContainerColors: Color.lerp(welcomeScreenContainerColors, other.welcomeScreenContainerColors, t),
    );
  }
}

extension AppColorsContext on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}