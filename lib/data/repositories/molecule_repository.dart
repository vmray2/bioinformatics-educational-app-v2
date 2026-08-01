import 'package:binf_educational_app_redone/data/local/collections/molecule_collection.dart';
import 'package:binf_educational_app_redone/data/local/isar_service.dart';
import 'package:binf_educational_app_redone/domain/models/molecule.dart';
import 'package:binf_educational_app_redone/domain/models/molecule_query_filter.dart';
import 'package:isar_community/isar.dart';

class MoleculeRepository {
  final IsarService _localDb;

  MoleculeRepository({
    required IsarService localDb,
  }) : _localDb = localDb;

  Future<Isar> get _db async => await _localDb.db;

  Stream<List<MoleculeCollection>> watchQuery(MoleculeQueryFilter filter) async* {
    final isar = await _db;

    QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition> query =
        isar.moleculeCollections.filter().idGreaterThan(-1);

    // Molecule Type Filter
    if (filter.type != null) {
      query = query.typeEqualTo(filter.type!);
    }

    // Search Text Query
    final searchTerm = filter.searchQuery?.trim() ?? '';
    if (searchTerm.isNotEmpty) {
      query = query.group((q) => q
          .nameContains(searchTerm, caseSensitive: false)
          .or()
          .descriptionContains(searchTerm, caseSensitive: false));
    }

    // Field Filters
    if (filter.chromosome != null && filter.chromosome!.isNotEmpty) {
      query = query.chromosomeEqualTo(filter.chromosome!, caseSensitive: false);
    }

    if (filter.pdbId != null && filter.pdbId!.isNotEmpty) {
      query = query.pdbIdEqualTo(filter.pdbId!, caseSensitive: false);
    }

    if (filter.organism != null && filter.organism!.isNotEmpty) {
      query = query.organismEqualTo(filter.organism!, caseSensitive: false);
    }

    if (filter.pubChemId != null && filter.pubChemId!.isNotEmpty) {
      query = query.pubChemIdEqualTo(filter.pubChemId!, caseSensitive: false);
    }

    if (filter.aminoAcidLength != null) {
      query = query.aminoAcidLengthEqualTo(filter.aminoAcidLength!);
    }

    if (filter.sortByField == 'name') {
      final sortedQuery = filter.sortAscending!
          ? query.sortByName()
          : query.sortByNameDesc();
      yield* sortedQuery.build().watch(fireImmediately: true);
    } else {
      yield* query.build().watch(fireImmediately: true);
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
}