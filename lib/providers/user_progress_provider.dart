import 'package:binf_educational_app_redone/data/repositories/user_progress_repository.dart';
import 'package:binf_educational_app_redone/domain/models/user_progress.dart';
import 'package:binf_educational_app_redone/providers/isar_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProgressNotifier extends Notifier<UserProgress> {
  UserProgressRepository get _repository => ref.read(userProgressRepositoryProvider);
  
  @override
  UserProgress build() {
    _initProgress();
    return const UserProgress();
  }

  Future<void> _initProgress() async {
    try {
      final savedProgress = await _repository.getUserProgress();
      state = savedProgress;
    } catch (e) {
      assert(false, 'Failed to initialize local user progress: $e');
    }
  }

  void unlockModule(String moduleId) {
    if (!state.unlockedModuleIds.contains(moduleId)) {
      state = state.copyWith(
        unlockedModuleIds: {...state.unlockedModuleIds, moduleId},
      );
      _saveToLocal();
    }
  }

  void unlockActivity(String activityId) {
    if (!state.unlockedActivityIds.contains(activityId)) {
      state = state.copyWith(
        unlockedModuleIds: {...state.unlockedActivityIds, activityId},
      );
      _saveToLocal();
    }
  }

  void awardBadge(String badgeId) {
    if (!state.unlockedActivityIds.contains(badgeId)) {
      state = state.copyWith(
        unlockedBadgeIds: {...state.unlockedBadgeIds, badgeId},
      );

      _saveToLocal();

      updateBadgeProgress(badgeId);
    }
  }
  
  void updateUserProgress({required int xp, required int currentLevel}) {
    final currentMetrics = state.userMetrics;
    
    final updatedMetrics = currentMetrics.copyWith(
      totalXp: currentMetrics.totalXp! + xp,
      currentLevel: currentLevel
    );

    state = state.copyWith(
      userMetrics: updatedMetrics,
    );

    _saveToLocal();
  }

  void updateModuleProgress(String moduleId, {required int status}) {
    final currentMetrics = state.moduleMetrics[moduleId] ?? const ModuleMetrics();
    
    final updatedMetrics = currentMetrics.copyWith(
      isCompleted: status == 2 ? true : false,
      status: status,
      lastAccessed: DateTime.now(), 
    );

    state = state.copyWith(
      moduleMetrics: {...state.moduleMetrics, moduleId: updatedMetrics},
    );

    _saveToLocal();
  }

  void updateModuleStepProgress(String moduleStepId, {required bool completed}) {
    final currentMetrics = state.moduleStepMetrics[moduleStepId] ?? const ModuleStepMetrics();
    
    final updatedMetrics = currentMetrics.copyWith(
      isCompleted: completed,
      lastAccessed: DateTime.now(), 
    );

    state = state.copyWith(
      moduleStepMetrics: {...state.moduleStepMetrics, moduleStepId: updatedMetrics},
    );

    _saveToLocal();
  }

  void updateActivityProgress(String activityId, {required int totalMistakes}) {
    final currentMetrics = state.activityMetrics[activityId] ?? const ActivityMetrics();
    
    final updatedMetrics = currentMetrics.copyWith(
      isCompleted: true,
      timesCompleted: currentMetrics.timesCompleted + 1,
      // Retain the minimum number of mistakes
      minMistakes: totalMistakes < currentMetrics.minMistakes ? totalMistakes : currentMetrics.minMistakes, 
    );

    state = state.copyWith(
      activityMetrics: {...state.activityMetrics, activityId: updatedMetrics},
    );

    _saveToLocal();
  }

  void updateBadgeProgress(String badgeId) {
    final currentMetrics = state.badgeMetrics[badgeId] ?? const BadgeMetrics();
    
    final updatedMetrics = currentMetrics.copyWith(
       dateUnlocked: DateTime.now(), 
    );

    state = state.copyWith(
      badgeMetrics: {...state.badgeMetrics, badgeId: updatedMetrics},
    );

    _saveToLocal();
  }

    void updateCompetencyProgress(String competencyId, int xp, bool isCompleted) {
    final currentMetrics = state.competencyMetrics[competencyId] ?? const CompetencyMetrics();
    
    final updatedMetrics = currentMetrics.copyWith(
      totalXp: currentMetrics.totalXp! + xp, 
      isCompleted: isCompleted
    );

    state = state.copyWith(
      competencyMetrics: {...state.competencyMetrics, competencyId: updatedMetrics},
    );

    _saveToLocal();
  }


  void _saveToLocal() {
    final currentState = state;
    
    _repository.saveProgress(currentState);
  }
}

final userProgressRepositoryProvider = Provider<UserProgressRepository>((ref) {
  final isarService = ref.watch(isarServiceProvider);
  return UserProgressRepository(localDb: isarService);
});

final userProgressProvider = StreamProvider<UserProgress>((ref) {
  final repository = ref.watch(userProgressRepositoryProvider);
  return repository.watchProgress();
});