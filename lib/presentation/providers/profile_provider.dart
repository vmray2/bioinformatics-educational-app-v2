import 'package:binf_educational_app_redone/data/local/isar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/local/collections/user_profile_collection.dart';
import '../../data/repositories/user_profile_repository.dart';

// 1. Provide the IsarService global singleton instance reference
final isarServiceProvider = Provider<IsarService>((ref) {
  return IsarService();
});

final userProfileRepositoryProvider = Provider<UserProfileRepository>((ref) {
  final isarService = ref.watch(isarServiceProvider);
  return UserProfileRepository(isarService.db);
});

// Loads state transitions for the user profile record
final startupProfileProvider = FutureProvider<UserProfileCollection?>((ref) async {
  final repo = ref.watch(userProfileRepositoryProvider);
  return await repo.fetchProfile();
});