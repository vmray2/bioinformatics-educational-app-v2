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
}

@Embedded()
class IsarModuleEntry {
  String? moduleId;
  int status = 0;
  DateTime? lastAccessed;
}

@Embedded()
class IsarModuleStepEntry {
  String? moduleStepId;
  bool isCompleted = false;
  DateTime? lastAccessed;
}

@Embedded()
class IsarActivityEntry {
  String? activityId;
  bool isCompleted = false;
  int minMistakes = 0;
  int timesCompleted = 0;
  DateTime? lastAccessed;
}

@Embedded()
class IsarBadgeEntry {
  String? badgeId;
  DateTime? dateUnlocked;
}

@Embedded()
class IsarCompetencyEntry {
  String? competencyId;
  int? totalXp;
  bool isCompleted = false;
}