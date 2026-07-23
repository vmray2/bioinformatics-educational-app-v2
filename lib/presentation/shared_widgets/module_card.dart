import 'package:binf_educational_app_redone/domain/models/module.dart';
import 'package:flutter/material.dart';
import 'package:binf_educational_app_redone/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ModuleCard extends StatelessWidget {
  final Module module;
  final int totalModuleStepsCompleted;
  final bool isLocked;
  final int? status;
  final VoidCallback? onTap;

  const ModuleCard({
    super.key,
    required this.module,
    required this.totalModuleStepsCompleted,
    required this.isLocked,
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final moduleNumber = module.moduleId.split("_")[1];

    return SizedBox(
      width: 150,
      child: Card(
        elevation: 1,
        color: !isLocked ? appColors.moduleCardBackgroundColor : appColors.moduleCardBackgroundColor?.withValues(alpha: 0.4),
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
              mainAxisSize: MainAxisSize.min,
              children: [
                !isLocked ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 30,
                          maxWidth: 30
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              //width: 30,
                              //height: 30,
                              child: CircularProgressIndicator(
                                key: Key("dashboard_module_card_progress_${module.moduleId}"),
                                value: totalModuleStepsCompleted / module.moduleSteps.length,
                                color: appColors.tertiaryColor,
                                backgroundColor: Color.fromRGBO(249, 248, 248, 1),
                              ),
                            ),
                            Text(
                              "$totalModuleStepsCompleted/${module.moduleSteps.length}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    status == 1 ? Icon(Icons.play_arrow) : status == 2 ? Icon(Icons.check, fontWeight: FontWeight.w900) : Container()
                  ],
                ) : Flexible(child: Icon(Icons.lock)),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 4),
                    child: Center(
                      child: Text(
                        "Module $moduleNumber",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: !isLocked ? appColors.textColor : appColors.textColor?.withValues(alpha: 0.4)
                        ),
                      )
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Center(
                    child: Text(
                      module.moduleName, 
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: !isLocked ? appColors.textColor : appColors.textColor?.withValues(alpha: 0.4)
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}