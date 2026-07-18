import 'package:binf_educational_app_redone/data/local/collections/user_profile_collection.dart';
import 'package:binf_educational_app_redone/data/local/collections/user_progress_collection.dart';
import 'package:binf_educational_app_redone/domain/models/user_progress.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  // 1. Create a private singleton instance
  static final IsarService _instance = IsarService._internal();
  
  // 2. Expose a public factory constructor to access the exact same instance everywhere
  factory IsarService() => _instance;
  
  IsarService._internal();

  Future<Isar>? _db;

  Future<Isar> get db {
    if (_db != null && Isar.getInstance() != null) {
      return _db!;
    }
    
    _db = _openDB();
    return _db!;
  }

  Future<Isar> _openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        UserProfileCollectionSchema,
        UserProgressCollectionSchema
      ],
      directory: dir.path,
      inspector: false
    );
  }

  void resetForTesting() {
    _db = null;
  }

Future<UserProgress?> loadUserProgress() async {
  final isar = await db;
  final localData = await isar.userProgressCollections.get(0);
  if (localData == null) return null;

  return UserProgress(
    unlockedModuleIds: localData.unlockedModules.toSet(),
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
    await isar?.writeTxn(() async {
      await isar.userProgressCollections.put(localData);
    });
  }
}