import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:binf_educational_app_redone/domain/models/molecule_query_filter.dart';

class ActiveFilterNotifier extends Notifier<MoleculeQueryFilter> {
  @override
  MoleculeQueryFilter build() {
    return const MoleculeQueryFilter();
  }

  void setFilter(MoleculeQueryFilter newFilter) {
    state = newFilter;
  }

  void reset() {
    state = const MoleculeQueryFilter();
  }

  void updateFilter(MoleculeQueryFilter Function(MoleculeQueryFilter current) updateFn) {
    state = updateFn(state);
  }
}

final activeFilterProvider = NotifierProvider<ActiveFilterNotifier, MoleculeQueryFilter>(
  ActiveFilterNotifier.new
);