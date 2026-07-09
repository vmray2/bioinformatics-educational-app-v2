import 'package:binf_educational_app_redone/domain/models/module.dart';

class Curriculum {
  final String catalogId;
  final String catalogVersion;
  final int totalModules;
  final List<Module> modules;

  Curriculum({
    required this.catalogId,
    required this.catalogVersion,
    required this.totalModules,
    required this.modules,
  });

  factory Curriculum.fromJson(Map<String, dynamic> json) {
    return Curriculum(
      catalogId: json['catalogId'] as String,
      catalogVersion: json['catalogVersion'] as String,
      totalModules: json['totalModules'] as int,
      modules: (json['modules'] as List<dynamic>)
          .map((m) => Module.fromJson(m as Map<String, dynamic>))
          .toList(),
    );
  }
}