import 'molecule.dart';

enum LogicalOperator { and, or }

class MoleculeQueryFilter {
  final MoleculeType? type;
  final String? searchQuery;
  final LogicalOperator? searchOperator; // AND vs OR between search terms

  // Gene Filters
  final String? chromosome;

  // Gene / Protein Filters
  final String? organism;

  // Protein Filters
  final String? pdbId;
  final int? aminoAcidLength;
  
  // Protein / Ligand Filters

  // Ligand Filters
  final String? pubChemId;

  // Sorting Properties
  final String? sortByField;
  final bool? sortAscending;
  
  const MoleculeQueryFilter({
    this.type, 
    this.searchQuery,
    this.chromosome, 
    this.organism, 
    this.pdbId, 
    this.pubChemId, 
    this.sortByField = 'name', 
    this.sortAscending = true, 
    this.aminoAcidLength, 
    this.searchOperator
  });

  bool get hasFilters =>
    type != null ||
    (searchQuery != null && searchQuery!.trim().isNotEmpty) ||
    (chromosome != null && chromosome!.trim().isNotEmpty) ||
    (pubChemId != null && pubChemId!.trim().isNotEmpty) ||
    (organism != null && organism!.trim().isNotEmpty) ||
    (pdbId != null && pdbId!.trim().isNotEmpty) ||
    sortByField != null ||
    sortAscending != null;

MoleculeQueryFilter copyWith({
    String? searchQuery,
    MoleculeType? type,
    LogicalOperator? searchOperator,
    String? chromosome,
    String? pdbId,
    String? chemicalFormula,
    String? organism,
    String? sortByField,
    String? pubChemId,
    bool? sortAscending,
    int? aminoAcidLength
  }) {
    return MoleculeQueryFilter(
      searchQuery: searchQuery ?? this.searchQuery,
      type: type ?? this.type,
      searchOperator: searchOperator ?? this.searchOperator,
      chromosome: chromosome ?? this.chromosome,
      pdbId: pdbId ?? this.pdbId,
      organism: organism ?? this.organism,
      sortByField: sortByField ?? this.sortByField,
      sortAscending: sortAscending ?? this.sortAscending,
      pubChemId: pubChemId ?? this.pubChemId,
      aminoAcidLength: aminoAcidLength ?? aminoAcidLength
    );
  }
}