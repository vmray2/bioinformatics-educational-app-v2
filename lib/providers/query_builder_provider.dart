import 'package:binf_educational_app_redone/domain/models/query_rule.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DraftFilterNotifier extends Notifier<CompositeQueryFilter> {
  @override
  CompositeQueryFilter build() {
    return const CompositeQueryFilter(rules: []);
  }

  // Add a new rule
  void addRule(QueryRule rule) {
    state = CompositeQueryFilter(
      rules: [...state.rules, rule],
    );
  }

  // Update an existing rule at a specific row index
  void updateRuleAt(int index, QueryRule updatedRule) {
    final updatedList = List<QueryRule>.from(state.rules);
    updatedList[index] = updatedRule;
    state = CompositeQueryFilter(rules: updatedList);
  }

  // Updates a rule by mutating the current live state
  void updateRuleDetails({
    required int index,
    LogicalConnector? connector,
    FilterField? field,
    dynamic value,
  }) {
    if (index < 0 || index >= state.rules.length) return;

    final updatedRules = List<QueryRule>.from(state.rules);
    final currentRule = updatedRules[index];

    updatedRules[index] = currentRule.copyWith(
      connector: connector ?? currentRule.connector,
      field: field ?? currentRule.field,
      value: value ?? currentRule.value,
    );

    state = CompositeQueryFilter(rules: updatedRules);
  }
  
  /// Delete a rule row
  void removeRuleAt(int index) {
    final updatedList = List<QueryRule>.from(state.rules)..removeAt(index);
    state = CompositeQueryFilter(rules: updatedList);
  }

  /// Reset form back to empty
  void clear() {
    state = const CompositeQueryFilter(rules: []);
  }
}

class ActiveFilterNotifier extends Notifier<CompositeQueryFilter> {
  @override
  CompositeQueryFilter build() {
    return const CompositeQueryFilter(rules: []);
  }

  void applyDraft(CompositeQueryFilter draft) {
    state = draft;
  }

  void setFilter(CompositeQueryFilter newFilter) {
    state = newFilter;
  }

  void reset() {
    state = const CompositeQueryFilter(rules: []);
  }

  void updateFilter(CompositeQueryFilter Function(CompositeQueryFilter current) updateFn) {
    state = updateFn(state);
  }
}

final draftFilterProvider = NotifierProvider<DraftFilterNotifier, CompositeQueryFilter>(
  DraftFilterNotifier.new,
);

final activeFilterProvider = NotifierProvider<ActiveFilterNotifier, CompositeQueryFilter>(
  ActiveFilterNotifier.new
);