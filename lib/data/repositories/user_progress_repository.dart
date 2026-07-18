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
      badgeMetrics: {}
    );

    await _localDb.saveUserProgress(initialProgress);

    return initialProgress;
  }

  Future<void> saveProgress(UserProgress progress) async {
    await _localDb.saveUserProgress(progress);
  }
}