import 'package:binf_educational_app_redone/presentation/shared_widgets/activity_objective_bar.dart';
import 'package:flutter/material.dart';

class ActivityBody extends StatelessWidget{
  final String objectiveText;
  final Widget activityContent;
  final Color? barColor;
  final Color? barBorderColor;
  final Color? barTextColor;
  
  const ActivityBody({super.key, required this.objectiveText, required this.activityContent, this.barColor, this.barBorderColor, this.barTextColor});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 100,
            child: Column(
              children: [
                Flexible(
                  flex: 9,
                  child: ActivityObjectiveBar(objectiveText: objectiveText, barColor: barColor, barBorderColor: barBorderColor, barTextColor: barTextColor,)
                ),
                Flexible(
                  flex: 91,
                  child: activityContent
                )
              ],
            )
          )
        ],
      ),
    );
  }
  
}