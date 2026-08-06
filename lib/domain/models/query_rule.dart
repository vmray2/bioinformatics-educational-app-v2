enum FilterField { name, type, organism, chromosome, fullName, startPosition, endPosition, pdbId, structureName, pubChemId, chemicalFormula, lipinski }
enum FilterOperator { equals, contains, notEquals, isNull, isNotNull }
enum LogicalConnector { and, or }

class QueryRule {
  final FilterField field;
  final FilterOperator operator;
  final dynamic value; // String, int, MoleculeType, etc.
  final LogicalConnector connector; // AND or OR before the next rule

  const QueryRule({
    required this.field,
    required this.operator,
    required this.value,
    this.connector = LogicalConnector.and,
  });

  QueryRule copyWith({
    FilterField? field,
    FilterOperator? operator,
    dynamic value,
    LogicalConnector? connector,
  }) {
    return QueryRule(
      field: field ?? this.field,
      operator: operator ?? this.operator,
      value: value ?? this.value,
      connector: connector ?? this.connector,
    );
  }

  @override
  String toString() {
    return "Field: ${this.field}\nOperator: ${this.operator}\nValue: ${this.value}\nConnector: ${this.connector}";
  }
}

class CompositeQueryFilter {
  final List<QueryRule> rules;

  const CompositeQueryFilter({this.rules = const []});
}

