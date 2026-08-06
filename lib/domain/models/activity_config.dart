import 'package:binf_educational_app_redone/domain/models/activity.dart';

class ActivityConfig {
  final List<dynamic> objectives; 
  final Activity? activity;
  final String activityId;

  // Codon Slider
  final String? referenceDataset;
  final String? targetSequence;
  final List<String>? expectedOutput;

  // Data Hub Query Builder
  final String? correctMoleculeId;

  // GWAS and PRS
  final String? datasetPath;
  final double? significanceThresholdLine;
  final List<int>? renderChromosomes;

  ActivityConfig({
    required this.activityId,
    this.activity,
    this.referenceDataset,
    this.targetSequence,
    this.expectedOutput,
    this.datasetPath,
    this.significanceThresholdLine,
    this.renderChromosomes, 
    required this.objectives, 
    this.correctMoleculeId
  });

  factory ActivityConfig.fromJson(Map<String, dynamic> json) {
    return ActivityConfig(
      activityId: json["activityId"] as String,
      objectives: json["objectives"] as List<dynamic>,
      activity: json["activity"] != null
          ? Activity.fromJson(json["activity"] as Map<String, dynamic>)
          : null,
      referenceDataset: json["referenceDataset"] as String?,
      targetSequence: json["targetSequence"] as String?,
      expectedOutput: json["expectedOutput"] as List<String>?,
      datasetPath: json["datasetPath"] as String?,
      significanceThresholdLine: json["significanceThresholdLine"] as double?,
      renderChromosomes: json["renderChromosomes"] as List<int>?,
      correctMoleculeId: json["correctMoleculeId"] as String?,
    );
  }
}
