import 'package:binf_educational_app_redone/data/repositories/molecule_repository.dart';
import 'package:binf_educational_app_redone/data/repositories/user_profile_repository.dart';
import 'package:binf_educational_app_redone/data/repositories/user_progress_repository.dart';
import 'package:binf_educational_app_redone/providers/isar_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProfileRepositoryProvider = Provider<UserProfileRepository>((ref) {
  final localDb = ref.watch(isarServiceProvider);
  
  return UserProfileRepository(localDb: localDb);
});

final userProgressRepositoryProvider = Provider<UserProgressRepository>((ref) {
  final localDb = ref.watch(isarServiceProvider);
  
  return UserProgressRepository(localDb: localDb);
});

final moleculeRepositoryProvider = Provider<MoleculeRepository>((ref) {
  final localDb = ref.watch(isarServiceProvider);

  return MoleculeRepository(localDb: localDb);
});