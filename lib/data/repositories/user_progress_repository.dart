import 'package:binf_educational_app_redone/data/local/collections/user_progress_collection.dart';
import 'package:binf_educational_app_redone/data/local/isar_service.dart';
import 'package:binf_educational_app_redone/domain/models/user_progress.dart';
import 'package:isar_community/isar.dart';

class UserProgressRepository {
  final IsarService _localDb;

  UserProgressRepository({
    required IsarService localDb,
  }) : _localDb = localDb;
  
  Future<Isar> get _db async => await _localDb.db;

  Future<UserProgress?> loadUserProgress() async {
    final isar = await _db;
    final localData = await isar.userProgressCollections.get(0);

    return UserProgress(
      unlockedModuleIds: localData!.unlockedModules.toSet(),
      unlockedActivityIds: localData.unlockedActivities.toSet(),
      unlockedBadgeIds: localData.unlockedBadges.toSet(),
      moduleMetrics: {
        for (var entry in localData.modules)
          entry.moduleId!: ModuleMetrics(
            status: entry.status,
            lastAccessed: entry.lastAccessed,
          )
      },
      moduleStepMetrics: {
        for (var entry in localData.moduleSteps)
          entry.moduleStepId!: ModuleStepMetrics(
            isCompleted: entry.isCompleted,
            lastAccessed: entry.lastAccessed,
          )
      },
      activityMetrics: {
        for (var entry in localData.activities)
          entry.activityId!: ActivityMetrics(
            isCompleted: entry.isCompleted,
            minMistakes: entry.minMistakes,
            timesCompleted: entry.timesCompleted,
          )
      },
      badgeMetrics: {
        for (var entry in localData.badges)
          entry.badgeId!: BadgeMetrics(
            dateUnlocked: entry.dateUnlocked,
          )
      },
    );
  }

  Future<void> saveUserProgress(UserProgress progress) async {
    final isar = await _db;

    final localData = UserProgressCollection()
      ..id = 0
      ..unlockedModules = progress.unlockedModuleIds.toList()
      ..unlockedActivities = progress.unlockedActivityIds.toList()
      ..unlockedBadges = progress.unlockedBadgeIds.toList()
      ..modules = progress.moduleMetrics.entries.map((e) {
        return IsarModuleEntry()
          ..moduleId = e.key
          ..status = e.value.status
          ..lastAccessed = e.value.lastAccessed;
      }).toList()
      ..moduleSteps = progress.moduleMetrics.entries.map((e) {
        return IsarModuleStepEntry()
          ..moduleStepId = e.key
          ..isCompleted = e.value.isCompleted
          ..lastAccessed = e.value.lastAccessed;
      }).toList()
      ..activities = progress.activityMetrics.entries.map((e) {
        return IsarActivityEntry()
          ..activityId = e.key
          ..isCompleted = e.value.isCompleted
          ..minMistakes = e.value.minMistakes
          ..timesCompleted = e.value.timesCompleted;
      }).toList()
      ..badges = progress.badgeMetrics.entries.map((e) {
        return IsarBadgeEntry()
          ..badgeId = e.key
          ..dateUnlocked = e.value.dateUnlocked;
      }).toList();

    // 2. Perform an atomic write transaction
    await isar.writeTxn(() async {
      await isar.userProgressCollections.put(localData);
    });
  }

  Future<UserProgress> getUserProgress() async {
    final localProgress = await loadUserProgress();
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

    await saveUserProgress(initialProgress);

    return initialProgress;
  }

  Future<void> saveProgress(UserProgress progress) async {
    await saveUserProgress(progress);
  }

  Stream<UserProgress> watchProgress({int id = 0}) async* {
    final isar = await _db;

    yield* isar.userProgressCollections
        .watchObject(id, fireImmediately: true)
        .map((entity) => entity?.toDomain() ?? UserProgress.initial(id: id));
  }
}