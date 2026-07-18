import 'package:binf_educational_app_redone/domain/models/activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final bool? isCompleted;
  final bool isLocked;
  final VoidCallback? onTap;

  const ActivityCard({
    super.key,
    required this.activity,
    required this.isCompleted,
    required this.isLocked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return SizedBox(
      width: 150,
      child: Card(
        elevation: 1,
        color: !isLocked ? appColors.activityCardBackgroundColor : appColors.activityCardBackgroundColor?.withValues(alpha: 0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: isLocked ? null : onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isLocked ? Icon(Icons.lock) : isCompleted! ? Icon(Icons.check, fontWeight: FontWeight.w900) : Container(),
                    activity.difficulty == "easy" ? 
                    Icon(
                      Icons.circle, 
                      color: !isLocked ? Colors.green : Colors.green.withValues(alpha: 0.4), 
                      size: 15
                    ) : 
                    activity.difficulty == "medium" ? 
                    Icon(
                      Icons.square, 
                      color: !isLocked ? Colors.yellow : Colors.yellow.withValues(alpha: 0.4), 
                      size: 15,
                    ) : 
                    Icon(
                      CupertinoIcons.triangle_fill, 
                      color: !isLocked ? Colors.red : Colors.red.withValues(alpha: 0.4), 
                      size: 15,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 4),
                  child: Center(
                    child: Text(
                      activity.name,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: !isLocked ? appColors.textColor : appColors.textColor?.withValues(alpha: 0.4)
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Module ${activity.associatedModule.split("_")[1]}",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: !isLocked ? appColors.textColor : appColors.textColor?.withValues(alpha: 0.4)
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}