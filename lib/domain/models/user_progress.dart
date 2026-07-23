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

class CompetencyMetrics {
  final int? totalXp;
  final bool isCompleted;

  const CompetencyMetrics({
    this.totalXp,
    this.isCompleted = false
  });

  CompetencyMetrics copyWith({int? totalXp, bool? isCompleted}) {
    return CompetencyMetrics(
      totalXp: totalXp ?? this.totalXp,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class UserMetrics {
  final int? totalXp;
  final int? currentLevel;
  final int? xpForCompletion = 1000;

  const UserMetrics({
    this.totalXp,
    this.currentLevel,
  });

  UserMetrics copyWith({int? totalXp, int? currentLevel}) {
    return UserMetrics(
      totalXp: totalXp ?? this.totalXp,
      currentLevel: currentLevel ?? this.currentLevel,
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

  final Map<String, CompetencyMetrics> competencyMetrics;

  final UserMetrics userMetrics;

  const UserProgress({
    this.unlockedModuleIds = const {'mod_1_bioinformatics_applications'},
    this.moduleMetrics = const {},
    this.moduleStepMetrics = const {},
    this.unlockedActivityIds = const {"act_module_flashcards"},
    this.activityMetrics = const {},
    this.unlockedBadgeIds = const {},
    this.badgeMetrics = const {},
    this.competencyMetrics = const {}, 
    this.userMetrics = const UserMetrics(totalXp: 0, currentLevel: 0)
    
    /*{
        "c1_role_of_bioinformatics": CompetencyMetrics(isCompleted: false, totalXp: 0), 
        "c2_computational_concepts": CompetencyMetrics(isCompleted: false, totalXp: 0), 
        "c3_statistical_concepts": CompetencyMetrics(isCompleted: false, totalXp: 0),
        "c4_bioinformatics_tools": CompetencyMetrics(isCompleted: false, totalXp: 0), 
        "c5_data_retrieval": CompetencyMetrics(isCompleted: false, totalXp: 0), 
        "c6_model": CompetencyMetrics(isCompleted: false, totalXp: 0),
        "c7_scripting": CompetencyMetrics(isCompleted: false, totalXp: 0), 
        "c8_data_types": CompetencyMetrics(isCompleted: false, totalXp: 0), 
        "c9_implications": CompetencyMetrics(isCompleted: false, totalXp: 0)
    }*/
    
  });

  CompetencyMetrics getCompetency(String competencyId) {
    return competencyMetrics[competencyId] ?? const CompetencyMetrics(
      isCompleted: false,
      totalXp: 0,
    );
  }

  UserMetrics getUserNetrics() {
    return userMetrics;
  }

  UserProgress copyWith({
    Set<String>? unlockedModuleIds,
    Map<String, ModuleMetrics>? moduleMetrics,
    Map<String, ModuleStepMetrics>? moduleStepMetrics,
    Set<String>? unlockedActivityIds,
    Map<String, ActivityMetrics>? activityMetrics,
    Set<String>? unlockedBadgeIds,
    Map<String, BadgeMetrics>? badgeMetrics,
    Map<String, CompetencyMetrics>? competencyMetrics,
    UserMetrics? userMetrics,
  }) {
    return UserProgress(
      unlockedModuleIds: unlockedModuleIds ?? this.unlockedModuleIds,
      moduleMetrics: moduleMetrics ?? this.moduleMetrics,
      moduleStepMetrics: moduleStepMetrics ?? this.moduleStepMetrics,
      unlockedActivityIds: unlockedActivityIds ?? this.unlockedActivityIds,
      activityMetrics: activityMetrics ?? this.activityMetrics,
      unlockedBadgeIds: unlockedBadgeIds ?? this.unlockedBadgeIds,
      badgeMetrics: badgeMetrics ?? this.badgeMetrics,
      competencyMetrics: competencyMetrics ?? this.competencyMetrics,
      userMetrics: userMetrics ?? this.userMetrics,
    );
  }
}