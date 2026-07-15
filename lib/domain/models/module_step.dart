import 'package:binf_educational_app_redone/domain/models/activity_config.dart';

class ModuleStep {
  final String stepId;
  final String title;
  final String type;
  final String markdownInstructions;
  final String imgPath;
  final String hint;
  final String status;
  final String estTime;
  final String description;
  final ActivityConfig? activityConfig;

  ModuleStep({
    required this.stepId,
    required this.title,
    required this.type,
    required this.markdownInstructions,
    required this.imgPath,
    required this.hint,
    required this.status,
    required this.estTime,
    required this.description,
    this.activityConfig
  });

  factory ModuleStep.fromJson(Map<String, dynamic> json) {
    return ModuleStep(
      stepId: json["stepId"] as String, 
      title: json["title"] as String, 
      type: json["type"] as String, 
      markdownInstructions: json["markdownInstructions"] as String, 
      imgPath: json["imgPath"] as String, 
      hint: json["hint"] as String, 
      status: json["status"] as String , 
      estTime: json["estTime"] as String, 
      description: json["description"] as String,
      activityConfig: json["activityConfig"] != null
          ? ActivityConfig.fromJson(json["activityConfig"] as Map<String, dynamic>)
          : null,
    );
  }
}