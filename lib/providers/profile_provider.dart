import 'package:binf_educational_app_redone/data/local/isar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/local/collections/user_profile_collection.dart';
import '../data/repositories/user_profile_repository.dart';

final isarServiceProvider = Provider<IsarService>((ref) {
  return IsarService();
});

final userProfileRepositoryProvider = Provider<UserProfileRepository>((ref) {
  final isarService = ref.watch(isarServiceProvider);
  return UserProfileRepository(localDb: isarService);
});

final startupProfileProvider = FutureProvider<UserProfileCollection?>((ref) async {
  final repo = ref.watch(userProfileRepositoryProvider);
  return await repo.fetchProfile();
});

final userProfileProvider = StreamProvider<UserProfileCollection?>((ref) {
  final repository = ref.watch(userProfileRepositoryProvider);
  return repository.watchProfile();
});