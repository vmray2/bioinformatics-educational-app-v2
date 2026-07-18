import 'package:binf_educational_app_redone/data/local/isar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isarServiceProvider = Provider<IsarService>((ref) {
  return IsarService();
});