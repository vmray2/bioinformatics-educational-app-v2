import 'package:binf_educational_app_redone/domain/models/activity.dart';
import 'package:binf_educational_app_redone/domain/models/binding_ligand.dart';
import 'package:binf_educational_app_redone/domain/models/receptor_pocket.dart';

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

  // Sequence Alignment
  final String? leftSequence;
  final String? topSequence;
  final Map<String, dynamic>? scoringSystem;
  final List<dynamic>? matrixAnswers;
  final List<dynamic>? matrixTracebackAnswers;
  final double? correctAlignmentScore;

  // GWAS and PRS
  final String? datasetPath;
  final double? significanceThresholdLine;
  final List<int>? renderChromosomes;

  //Molecular Docking Best Fit
  final ReceptorPocket? receptorPocket;
  final List<BindingLigand>? candidateLigands;

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
    this.correctMoleculeId, 
    this.receptorPocket, 
    this.candidateLigands, 
    this.leftSequence, 
    this.topSequence, 
    this.matrixAnswers, 
    this.matrixTracebackAnswers, 
    this.scoringSystem, 
    this.correctAlignmentScore,    
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
      leftSequence: json["leftSequence"] as String?,
      topSequence: json["topSequence"] as String?,
      scoringSystem: json['scoringSystem'] as Map<String, dynamic>?,
      matrixAnswers: json["matrixAnswers"] as List<dynamic>?,
      matrixTracebackAnswers: json["matrixTracebackAnswers"] as List<dynamic>?,
      correctAlignmentScore: json["correctAlignmentScore"] as double?,
      significanceThresholdLine: json["significanceThresholdLine"] as double?,
      renderChromosomes: json["renderChromosomes"] as List<int>?,
      correctMoleculeId: json["correctMoleculeId"] as String?,
      receptorPocket: json["receptorRequirements"] != null
          ? ReceptorPocket.fromJson(json["receptorPocket"] as Map<String, dynamic>)
          : null,
      candidateLigands: (json['candidateLigands'] as List<dynamic>?)
          ?.map((e) => BindingLigand.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
