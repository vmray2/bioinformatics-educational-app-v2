import 'package:binf_educational_app_redone/data/repositories/user_progress_repository.dart';
import 'package:binf_educational_app_redone/presentation/providers/isar_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProgressRepositoryProvider = Provider<UserProgressRepository>((ref) {
  final localDb = ref.watch(isarServiceProvider);
  
  return UserProgressRepository(localDb: localDb);
});