import 'package:binf_educational_app_redone/domain/models/user_progress.dart';
import 'package:isar_community/isar.dart';

part 'user_progress_collection.g.dart';

@Collection()
class UserProgressCollection {
  Id id = Isar.autoIncrement;

  List<String> unlockedModules = [];
  List<String> unlockedActivities = [];
  List<String> unlockedBadges = [];
  List<IsarModuleEntry> modules = [];
  List<IsarModuleStepEntry> moduleSteps = [];
  List<IsarActivityEntry> activities = [];
  List<IsarBadgeEntry> badges = [];
  List<IsarCompetencyEntry> competencies = [];
  IsarUserEntry user = IsarUserEntry();

  UserProgressCollection();

  UserProgressCollection.create({
    this.id = 1,
    required this.unlockedModules,
    required this.unlockedActivities,
    required this.unlockedBadges,
    required this.modules,
    required this.moduleSteps,
    required this.activities,
    required this.badges,
    required this.competencies,
    required this.user
  });

  factory UserProgressCollection.fromDomain(UserProgress domain) {
    List<IsarModuleEntry> convertedModuleMetrics = [];
    List<IsarModuleStepEntry> convertedModuleStepMetrics = [];
    List<IsarActivityEntry> convertedActivityMetrics = [];
    List<IsarBadgeEntry> convertedBadgeMetrics = [];
    List<IsarCompetencyEntry> convertedCompetencyMetrics = [];
    IsarUserEntry convertedUserMetrics;

    for (String key in domain.moduleMetrics.keys) {
      IsarModuleEntry moduleEntry = IsarModuleEntry.create(
        key, 
        domain.moduleMetrics[key]!.status, 
        domain.moduleMetrics[key]!.lastAccessed, 
        domain.moduleMetrics[key]!.isCompleted
      );

      convertedModuleMetrics.add(moduleEntry);
    }

    for (String key in domain.moduleStepMetrics.keys) {
      IsarModuleStepEntry moduleStepEntry = IsarModuleStepEntry.create(
        key, 
        domain.moduleStepMetrics[key]!.status, 
        domain.moduleStepMetrics[key]!.isCompleted, 
        domain.moduleStepMetrics[key]!.lastAccessed
      );

      convertedModuleStepMetrics.add(moduleStepEntry);
    }

    for (String key in domain.activityMetrics.keys) {
      IsarActivityEntry activityEntry = IsarActivityEntry.create(
        key, 
        domain.activityMetrics[key]!.isCompleted, 
        domain.activityMetrics[key]!.minMistakes, 
        domain.activityMetrics[key]!.timesCompleted,
        domain.activityMetrics[key]!.lastAccessed
      );

      convertedActivityMetrics.add(activityEntry);
    }

    for (String key in domain.activityMetrics.keys) {
      IsarActivityEntry activityEntry = IsarActivityEntry.create(
        key, 
        domain.activityMetrics[key]!.isCompleted, 
        domain.activityMetrics[key]!.minMistakes, 
        domain.activityMetrics[key]!.timesCompleted,
        domain.activityMetrics[key]!.lastAccessed
      );

      convertedActivityMetrics.add(activityEntry);
    }

    for (String key in domain.badgeMetrics.keys) {
      IsarBadgeEntry badgeEntry = IsarBadgeEntry.create(
        key, 
        domain.badgeMetrics[key]!.dateUnlocked, 
      );

      convertedBadgeMetrics.add(badgeEntry);
    }

    for (String key in domain.competencyMetrics.keys) {
      IsarCompetencyEntry competencyEntry = IsarCompetencyEntry.create(
        key, 
        domain.competencyMetrics[key]!.totalXp, 
        domain.competencyMetrics[key]!.isCompleted, 
      );

      convertedCompetencyMetrics.add(competencyEntry);
    }

    convertedUserMetrics = IsarUserEntry.create(
      domain.userMetrics.totalXp,
      domain.userMetrics.currentLevel,
      domain.userMetrics.xpForCompletion
    );

    return UserProgressCollection()
      ..unlockedModules = domain.unlockedModuleIds.toList()
      ..unlockedActivities = domain.unlockedActivityIds.toList()
      ..unlockedBadges = domain.unlockedBadgeIds.toList()
      ..modules = convertedModuleMetrics
      ..moduleSteps = convertedModuleStepMetrics
      ..activities = convertedActivityMetrics
      ..badges = convertedBadgeMetrics
      ..competencies = convertedCompetencyMetrics
      ..user = convertedUserMetrics;
  }


}

@Embedded()
class IsarUserEntry {
  int? totalXp = 0;
  int? currentLevel = 1;
  int? xpForCompletion = 1000;

  IsarUserEntry();

  IsarUserEntry.create(
    this.totalXp,
    this.currentLevel,
    this.xpForCompletion
  );
}

@Embedded()
class IsarModuleEntry {
  String? moduleId;
  int status = 0;
  DateTime? lastAccessed;
  bool isCompleted = false;

  IsarModuleEntry();

  IsarModuleEntry.create(
    this.moduleId,
    this.status,
    this.lastAccessed,
    this.isCompleted
  );
}

@Embedded()
class IsarModuleStepEntry {
  String? moduleStepId;
  int status = 0;
  bool isCompleted = false;
  DateTime? lastAccessed;

  IsarModuleStepEntry();

  IsarModuleStepEntry.create(
    this.moduleStepId,
    this.status,
    this.isCompleted,
    this.lastAccessed
  );
}

@Embedded()
class IsarActivityEntry {
  String? activityId;
  bool isCompleted = false;
  int minMistakes = 0;
  int timesCompleted = 0;
  DateTime? lastAccessed;

  IsarActivityEntry();

  IsarActivityEntry.create(
    this.activityId,
    this.isCompleted,
    this.minMistakes,
    this.timesCompleted,
    this.lastAccessed
  );
}

@Embedded()
class IsarBadgeEntry {
  String? badgeId;
  DateTime? dateUnlocked;

  IsarBadgeEntry();

  IsarBadgeEntry.create(
    this.badgeId,
    this.dateUnlocked
  );
}

@Embedded()
class IsarCompetencyEntry {
  String? competencyId;
  int? totalXp;
  bool isCompleted = false;

  IsarCompetencyEntry();

  IsarCompetencyEntry.create(
    this.competencyId,
    this.totalXp,
    this.isCompleted
  );
}