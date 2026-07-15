import 'package:binf_educational_app_redone/domain/models/module_step.dart';

class Module {
  final String moduleId;
  final String moduleName;
  final String description;
  final String status;
  final String estTime;
  final Map<String, dynamic> competenciesXp;
  final List<ModuleStep> moduleSteps;

  Module ({
    required this.moduleId,
    required this.moduleName,
    required this.description,
    required this.status,
    required this.estTime,
    required this.competenciesXp,
    required this.moduleSteps
  });

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      moduleId: json["moduleId"] as String, 
      moduleName: json["moduleName"] as String, 
      description: json["description"] as String, 
      status: json["status"] as String, 
      estTime: json["estTime"] as String, 
      competenciesXp: json["competenciesXp"] as Map<String, dynamic>, 
      moduleSteps: (json["moduleSteps"] as List<dynamic>)
              .map((m) => ModuleStep.fromJson(m as Map<String, dynamic>))
              .toList(),
    );
  }
}