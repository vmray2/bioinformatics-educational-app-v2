import 'package:binf_educational_app_redone/domain/models/module.dart';
import 'package:flutter/material.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
//import 'package:google_fonts/google_fonts.dart';

class ModuleCard extends StatelessWidget {
  final Module module;
  final bool isLocked;
  final VoidCallback? onTap;

  const ModuleCard({
    super.key,
    required this.module,
    required this.isLocked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return SizedBox(
      width: 200,
      child: Card(
        elevation: 0,
        color: appColors.moduleCardBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: isLocked ? null : onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}