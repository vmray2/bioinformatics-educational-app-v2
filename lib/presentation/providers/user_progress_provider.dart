
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UnlockedModulesNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() {
    return {'mod_1_bioinformatics_applications'}; 
  }

  void unlockModule(String moduleId) {
    if (!state.contains(moduleId)) {
      state = {...state, moduleId};
      
      // _isarService.saveProgress(moduleId);
    }
  }
}

final unlockedModulesProvider = NotifierProvider<UnlockedModulesNotifier, Set<String>>(
  UnlockedModulesNotifier.new,
);