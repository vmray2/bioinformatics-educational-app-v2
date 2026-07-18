class ActivityMetrics {
  final bool isCompleted;
  final int minMistakes;
  final int timesCompleted;

  const ActivityMetrics({
    this.isCompleted = false,
    this.minMistakes = 0,
    this.timesCompleted = 0,
  });

  ActivityMetrics copyWith({bool? isCompleted, int? minMistakes, int? timesCompleted}) {
    return ActivityMetrics(
      isCompleted: isCompleted ?? this.isCompleted,
      minMistakes: minMistakes ?? this.minMistakes,
      timesCompleted: timesCompleted ?? this.timesCompleted,
    );
  }
}

class ModuleMetrics {
  final bool isCompleted;
  final int status;
  final DateTime? lastAccessed;

  const ModuleMetrics({
    this.isCompleted = false,
    this.status = 0,
    this.lastAccessed,
  });

  ModuleMetrics copyWith({bool? isCompleted, int? status, DateTime? lastAccessed}) {
    return ModuleMetrics(
      isCompleted: isCompleted ?? this.isCompleted,
      status: status ?? this.status,
      lastAccessed: lastAccessed ?? this.lastAccessed,
    );
  }
}

class ModuleStepMetrics {
  final bool isCompleted;
  final int status;
  final DateTime? lastAccessed;

  const ModuleStepMetrics({
    this.isCompleted = false,
    this.status = 0,
    this.lastAccessed,
  });

  ModuleStepMetrics copyWith({bool? isCompleted, int? status, DateTime? lastAccessed}) {
    return ModuleStepMetrics(
      isCompleted: isCompleted ?? this.isCompleted,
      status: status ?? this.status,
      lastAccessed: lastAccessed ?? this.lastAccessed,
    );
  }
}

class BadgeMetrics {
  final DateTime? dateUnlocked;

  const BadgeMetrics({
    this.dateUnlocked,
  });

  BadgeMetrics copyWith({DateTime? dateUnlocked}) {
    return BadgeMetrics(
      dateUnlocked: dateUnlocked ?? this.dateUnlocked,
    );
  }
}

class UserProgress {
  final Set<String> unlockedModuleIds;
  final Map<String, ModuleMetrics> moduleMetrics;

  final Map<String, ModuleStepMetrics> moduleStepMetrics;

  final Set<String> unlockedActivityIds;
  final Map<String, ActivityMetrics> activityMetrics;

  final Set<String> unlockedBadgeIds;
  final Map<String, BadgeMetrics> badgeMetrics;



  const UserProgress({
    this.unlockedModuleIds = const {'mod_1_bioinformatics_applications'},
    this.moduleMetrics = const {},
    this.moduleStepMetrics = const {},
    this.unlockedActivityIds = const {"act_module_flashcards"},
    this.activityMetrics = const {},
    this.unlockedBadgeIds = const {},
    this.badgeMetrics = const {},
  });

  UserProgress copyWith({
    Set<String>? unlockedModuleIds,
    Map<String, ModuleMetrics>? moduleMetrics,
    Map<String, ModuleStepMetrics>? moduleStepMetrics,
    Set<String>? unlockedActivityIds,
    Map<String, ActivityMetrics>? activityMetrics,
    Set<String>? unlockedBadgeIds,
    Map<String, BadgeMetrics>? badgeMetrics,
  }) {
    return UserProgress(
      unlockedModuleIds: unlockedModuleIds ?? this.unlockedModuleIds,
      moduleMetrics: moduleMetrics ?? this.moduleMetrics,
      moduleStepMetrics: moduleStepMetrics ?? this.moduleStepMetrics,
      unlockedActivityIds: unlockedActivityIds ?? this.unlockedActivityIds,
      activityMetrics: activityMetrics ?? this.activityMetrics,
      unlockedBadgeIds: unlockedBadgeIds ?? this.unlockedBadgeIds,
      badgeMetrics: badgeMetrics ?? this.badgeMetrics,
    );
  }
}