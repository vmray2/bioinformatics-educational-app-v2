import 'package:binf_educational_app_redone/data/local/isar_service.dart';
import 'package:binf_educational_app_redone/domain/models/user_progress.dart';

class UserProgressRepository {
  final IsarService _localDb;

  UserProgressRepository({
    required IsarService localDb,
  }) : _localDb = localDb;

  Future<UserProgress> getUserProgress() async {
    final localProgress = await _localDb.loadUserProgress();
    // Return progress if it exists
    if (localProgress != null) {
      return localProgress;
    }

    // Default progress for first time user
    final initialProgress = const UserProgress(
      unlockedModuleIds: {'mod_1_bioinformatics_applications'},
      unlockedActivityIds: {"act_module_flashcards"},
      unlockedBadgeIds: {},
      moduleMetrics: {},
      moduleStepMetrics: {},
      activityMetrics: {},
      badgeMetrics: {},
      competencyMetrics: {
        "c1_role_of_bioinformatics": CompetencyMetrics(isCompleted: false, totalXp: 0), 
        "c2_computational_concepts": CompetencyMetrics(isCompleted: false, totalXp: 0), 
        "c3_statistical_concepts": CompetencyMetrics(isCompleted: false, totalXp: 0),
        "c4_bioinformatics_tools": CompetencyMetrics(isCompleted: false, totalXp: 0), 
        "c5_data_retrieval": CompetencyMetrics(isCompleted: false, totalXp: 0), 
        "c6_model": CompetencyMetrics(isCompleted: false, totalXp: 0),
        "c7_scripting": CompetencyMetrics(isCompleted: false, totalXp: 0), 
        "c8_data_types": CompetencyMetrics(isCompleted: false, totalXp: 0), 
        "c9_implications": CompetencyMetrics(isCompleted: false, totalXp: 0)
      },
      userMetrics: UserMetrics(totalXp: 0, currentLevel: 1)
    );

    await _localDb.saveUserProgress(initialProgress);

    return initialProgress;
  }

  Future<void> saveProgress(UserProgress progress) async {
    await _localDb.saveUserProgress(progress);
  }
}