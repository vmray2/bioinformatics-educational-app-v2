import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/local/collections/user_profile_collection.dart';
import '../../data/repositories/user_profile_repository.dart';

final userProfileRepositoryProvider = Provider<UserProfileRepository>((ref) {
  return UserProfileRepository();
});

// Loads state transitions for the user profile record
final startupProfileProvider = FutureProvider<UserProfileCollection?>((ref) async {
  final repo = ref.watch(userProfileRepositoryProvider);
  return await repo.fetchProfile();
});