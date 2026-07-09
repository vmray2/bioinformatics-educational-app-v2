import 'package:binf_educational_app_redone/domain/models/activity.dart';

class ActivityConfig {
  final String type; // e.g., codon_slider or gwas_prs
  final Activity? activity;

  // Codon Slider
  final String? referenceDataset;
  final String? targetSequence;
  final List<String>? expectedOutput;

  // GWAS and PRS
  final String? datasetPath;
  final double? significanceThresholdLine;
  final List<int>? renderChromosomes;

  ActivityConfig({
    required this.type,
    this.activity,
    this.referenceDataset,
    this.targetSequence,
    this.expectedOutput,
    this.datasetPath,
    this.significanceThresholdLine,
    this.renderChromosomes
  });

  factory ActivityConfig.fromJson(Map<String, dynamic> json) {
    return ActivityConfig(
      type: json["type"] as String,
      activity: json["activity"] != null
          ? Activity.fromJson(json["activity"] as Map<String, dynamic>)
          : null,
      referenceDataset: json["referenceDataset"] as String,
      targetSequence: json["targetSequence"] as String,
      expectedOutput: json["expectedOutput"] as List<String>,
      datasetPath: json["datasetPath"] as String,
      significanceThresholdLine: json["significanceThresholdLine"] as double,
      renderChromosomes: json["renderChromosomes"] as List<int>
    );
  }
}
