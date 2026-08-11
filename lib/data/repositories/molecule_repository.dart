import 'package:binf_educational_app_redone/data/local/collections/molecule_collection.dart';
import 'package:binf_educational_app_redone/data/local/isar_service.dart';
import 'package:binf_educational_app_redone/domain/models/molecule.dart';
import 'package:binf_educational_app_redone/domain/models/query_rule.dart';
import 'package:isar_community/isar.dart';

class MoleculeRepository {
  final IsarService _localDb;

  MoleculeRepository({
    required IsarService localDb,
  }) : _localDb = localDb;

  Future<Isar> get _db async => await _localDb.db;

  Stream<List<MoleculeCollection>> watchQuery(CompositeQueryFilter filter) async* {
    final isar = await _db;

    if (filter.rules.isEmpty) {
      yield* isar.moleculeCollections.where().watch(fireImmediately: true);
      return;
    }

    // Initial base condition
    QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition> query =
        isar.moleculeCollections.filter().idGreaterThan(-1);

    // Loop through rules
    for (int i = 0; i < filter.rules.length; i++) {
      final rule = filter.rules[i];
      final isOr = (i > 0) && (filter.rules[i - 1].connector == LogicalConnector.or);

      // Call .or() on query if needed
      final QueryBuilder<MoleculeCollection, MoleculeCollection, QFilterCondition> builder =
          isOr ? query.or() : query;

      // Apply the field condition
      query = _applyRule(builder, rule);
    }

    yield* query.build().watch(fireImmediately: true);
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition> _applyRule(
    QueryBuilder<MoleculeCollection, MoleculeCollection, QFilterCondition> builder,
    QueryRule rule,
  ) {
    switch (rule.field) {
      /* case FilterField.name:
        return rule.operator == FilterOperator.contains
            ? builder.nameContains(rule.value as String, caseSensitive: false)
            : builder.nameEqualTo(rule.value as String, caseSensitive: false); */

      case FilterField.name:
        if (rule.operator == FilterOperator.notEquals) {
          return builder.not().nameEqualTo(rule.value as String, caseSensitive: false);
        }
        return builder.nameEqualTo(rule.value as String, caseSensitive: false);

      case FilterField.type:
        return builder.typeEqualTo(rule.value as MoleculeType);

      case FilterField.chromosome:
        if (rule.operator == FilterOperator.notEquals) {
          return builder.not().chromosomeEqualTo(rule.value as String, caseSensitive: false);
        }
        return builder.chromosomeEqualTo(rule.value as String, caseSensitive: false);

      case FilterField.pubChemId:
        if (rule.operator == FilterOperator.notEquals) {
          return builder.not().pubChemIdEqualTo(rule.value as String, caseSensitive: false);
        }
        return builder.pubChemIdEqualTo(rule.value as String, caseSensitive: false);

      case FilterField.chemicalFormula:
        if (rule.operator == FilterOperator.notEquals) {
          return builder.not().chemicalFormulaEqualTo(rule.value as String, caseSensitive: false);
        }
        return builder.chemicalFormulaEqualTo(rule.value as String, caseSensitive: false);

      case FilterField.organism:
        if (rule.operator == FilterOperator.notEquals) {
          return builder.not().organismEqualTo(rule.value as String, caseSensitive: false);
        }
        return builder.organismEqualTo(rule.value as String, caseSensitive: false);  

      case FilterField.fullName:
        if (rule.operator == FilterOperator.notEquals) {
          return builder.not().fullNameEqualTo(rule.value as String, caseSensitive: false);
        }
        return builder.fullNameEqualTo(rule.value as String, caseSensitive: false); 

      case FilterField.startPosition:
        if (rule.operator == FilterOperator.notEquals) {
          return builder.not().startPositionEqualTo(rule.value as int);
        }
        return builder.startPositionEqualTo(rule.value as int); 

      case FilterField.endPosition:
        if (rule.operator == FilterOperator.notEquals) {
          return builder.not().endPositionEqualTo(rule.value as int);
        }
        return builder.endPositionEqualTo(rule.value as int); 

      case FilterField.pdbId:
        if (rule.operator == FilterOperator.notEquals) {
          return builder.not().pdbIdEqualTo(rule.value as String, caseSensitive: false);
        }
        return builder.pdbIdEqualTo(rule.value as String, caseSensitive: false); 

      case FilterField.structureName:
        if (rule.operator == FilterOperator.notEquals) {
          return builder.not().structureNameEqualTo(rule.value as String, caseSensitive: false);
        }
        return builder.structureNameEqualTo(rule.value as String, caseSensitive: false); 
        
      case FilterField.lipinski:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
  
  List<String> getAvailableFilterFields(MoleculeType? type) {
    switch (type) {
      case MoleculeType.gene:
        return [
          'name',
          'chromosome',
          'organism',
          'strand',
          'startPosition',
          'endPosition',
        ];
      case MoleculeType.protein:
        return [
          'name',
          'pdbId',
          'aminoAcidLength',
          'molecularWeightkDa',
          'primaryFunction',
        ];
      case MoleculeType.ligand:
        return [
          'name',
          'smiles',
          'chemicalFormula',
          'molecularWeight',
          'pubChemId',
          'logP',
        ];
      case null:
        return ['name', 'description'];
    }
  }

  Future<Stream<List<MoleculeCollection>>> watchMolecules() async {
    final isar = await _db;
    return isar.moleculeCollections.where().watch();
  }

  Stream<MoleculeCollection?> watchMoleculeById(int id) async* {
    final isar = await _db;
    yield* isar.moleculeCollections.watchObject(id, fireImmediately: true);
  }

  Stream<MoleculeCollection?> watchMoleculeByStringId(String stringId) async* {
    final isar = await _db;
    
    yield* isar.moleculeCollections
        .filter()
        .moleculeIdEqualTo(stringId)
        .watch(fireImmediately: true)
        .map((list) => list.firstOrNull);
  }

  Stream<List<MoleculeCollection>> watchMoleculesByStringIds(List<String> stringIds) async* {
    final isar = await _db;
    
    yield* isar.moleculeCollections
        .filter()
        .anyOf(stringIds, (q, String id) => q.moleculeIdEqualTo(id))
        .watch(fireImmediately: true);
  }
}