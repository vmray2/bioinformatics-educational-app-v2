import 'package:binf_educational_app_redone/data/local/isar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';

final isarServiceProvider = Provider<IsarService>((ref) {
  return IsarService();
});

final isarInstanceProvider = FutureProvider<Isar>((ref) async {
  final isarService = ref.watch(isarServiceProvider);
  return await isarService.db;
});