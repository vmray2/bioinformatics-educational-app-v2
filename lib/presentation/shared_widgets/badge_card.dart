import 'package:flutter/material.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:binf_educational_app_redone/domain/models/badge.dart';
import 'package:google_fonts/google_fonts.dart';

class BadgeCard extends StatelessWidget {
  final CompetencyBadge badge;
  final bool isLocked;
  final VoidCallback? onTap;

  const BadgeCard({
    super.key,
    required this.badge,
    required this.isLocked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return SizedBox(
      //height: 30,
      width: 100,
      child: Card(
        elevation: 0,
        color: !isLocked ? appColors.badgeCardBackgroundColor : appColors.badgeCardBackgroundColor?.withValues(alpha: 0.4),
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
                /*Expanded(
                  child: !isLocked ? Container() : Icon(Icons.lock, size: 20,)
                ),*/
                Flexible(
                  flex: 3,
                  child: Center(
                    child: Image.asset(
                      badge.imgPath,
                      //width: 50,
                      //height: 50,
                      opacity: !isLocked ? const AlwaysStoppedAnimation(1) : const AlwaysStoppedAnimation(0.4),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Flexible(
                  child: Center(
                    child: Text(
                      badge.name,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1,
                        color: !isLocked ? appColors.textColor : appColors.textColor?.withValues(alpha: 0.4)
                      ),
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