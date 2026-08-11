import 'package:binf_educational_app_redone/domain/models/molecule.dart';
import 'package:isar_community/isar.dart';

part 'molecule_collection.g.dart';

@Collection()
class MoleculeCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String moleculeId;

  @Index(type: IndexType.value)
  late String name;

  @Enumerated(EnumType.name)
  late MoleculeType type;

  String? description;
  List<String> synonyms = [];
  String localMoleculeId = "";

  // Gene Specific Fields
  String? chromosome;
  int? startPosition;
  int? endPosition;
  String? strand;
  String? cytogeneticBand = "";
  int? exonCount = 0;
  String? fullName = "";
  String? organism = "";

  // Protein Specific Fields
  String? pdbId;
  int? aminoAcidLength;
  double? molecularWeightkDa;
  String? structureName;
  int? atomCount = 0;
  String? primaryFunction = "";

  // Gene and Protein Specific Fields
  String? pathToFasta;

  // Ligand Specific Fields
  String? smiles;
  String? pubChemId = "";
  double? molecularWeight;
  String? chemicalFormula;
  double? logP = 0.0;
  int? rotatableBonds = 0; 
  double? polarSurfaceAreaAng = 0.0; 
  int? hydrogenBondDonors = 0;
  int? hydrogenBondAcceptors = 0;
  int? hydrophobicFeatures = 0;
  String? pathTo2DStructure;
  String? pathToSDF;

  // Protein and Ligand Specific Fields
  String? pathTo3DStructure;

  MoleculeCollection();

  Molecule toDomain() {
    switch (type) {
      case MoleculeType.gene:
        return GeneMolecule(
          id: moleculeId,
          name: name,
          description: description,
          synonyms: synonyms,
          chromosome: chromosome ?? '',
          startPosition: startPosition ?? 0,
          endPosition: endPosition ?? 0,
          strand: strand ?? '+', 
          organism: organism, 
          exonCount: exonCount, 
          cytogeneticBand: cytogeneticBand, 
          fullName: fullName,
          pathToFasta: pathToFasta,
          moleculeId: localMoleculeId
        );
      case MoleculeType.protein:
        return ProteinMolecule(
          id: moleculeId,
          name: name,
          description: description,
          synonyms: synonyms,
          pdbId: pdbId ?? '',
          aminoAcidLength: aminoAcidLength ?? 0,
          molecularWeightkDa: molecularWeightkDa ?? 0.0, 
          structureName: '', 
          atomCount: atomCount, 
          organism: organism, 
          primaryFunction: primaryFunction,
          pathTo3DStructure: pathTo3DStructure,
          moleculeId: localMoleculeId
        );
      case MoleculeType.ligand:
        return LigandMolecule(
          id: moleculeId,
          name: name,
          description: description,
          synonyms: synonyms,
          smiles: smiles ?? '',
          chemicalFormula: chemicalFormula ?? '',
          molecularWeight: molecularWeight ?? 0.0,
          pubChemId: pubChemId,
          logP: logP, 
          rotatableBonds: rotatableBonds, 
          polarSurfaceAreaAng: polarSurfaceAreaAng, 
          hydrogenBondDonors: hydrogenBondDonors, 
          hydrogenBondAcceptors: hydrogenBondAcceptors,
          hydrophobicFeatures: hydrophobicFeatures,
          pathTo2DStructure: pathTo2DStructure,
          pathTo3DStructure: pathTo3DStructure,
          pathToSDF: pathToSDF, 
          moleculeId: localMoleculeId
        );
    }
  }

  List<String> getAvailableFilterFields(MoleculeType type) {
    return switch (type) {
      MoleculeType.gene => ['Name', 'Chromosome', 'Start Position', 'End Position', 'Strand'],
      MoleculeType.protein => ['Name', 'PDB ID', 'Amino Acid Length', 'Molecular Weight (kDa)'],
      MoleculeType.ligand => ['Name', 'SMILES', 'Formula', 'Molecular Weight (g/mol)', 'LogP', 'PubChem CID'],
    };
  }

  factory MoleculeCollection.fromJson(Map<String, dynamic> json) {
    final typeString = json['type'] as String;

    final type = MoleculeType.values.firstWhere(
      (e) => e.name == typeString,
      orElse: () => MoleculeType.gene,
    );

    return MoleculeCollection()
      ..moleculeId = json['id'] as String
      ..localMoleculeId = json["moleculeId"] as String
      ..name = json['name'] as String
      ..type = type
      ..description = json['description'] as String?
      ..synonyms = (json['synonyms'] as List<dynamic>?)?.cast<String>() ?? []

      // Gene fields
      ..chromosome = json['chromosome'] as String?
      ..startPosition = json['startPosition'] as int?
      ..endPosition = json['endPosition'] as int?
      ..strand = json['strand'] as String?
      ..fullName = json["fullName"] as String?
      
      // Protein fields
      ..pdbId = json['pdbId'] as String?
      ..aminoAcidLength = json['aminoAcidLength'] as int?
      ..molecularWeightkDa = (json['molecularWeightkDa'] as num?)?.toDouble()
      ..atomCount = json["atomCount"] as int?
      ..primaryFunction = json["primaryFunction"] as String?

      // Gene and Protein fields
      ..organism = json["organism"] as String?
      ..pathToFasta = json["pathToFasta"] as String?
      
      // Ligand fields
      ..smiles = json['smiles'] as String?
      ..pubChemId = json['pubChemId'] as String?
      ..chemicalFormula = json['chemicalFormula'] as String?
      ..molecularWeight = (json['molecularWeight'] as num?)?.toDouble()
      ..hydrogenBondDonors = json["hydrogenBondDonors"] as int?
      ..hydrogenBondAcceptors = json["hydrogenBondAcceptors"] as int?
      ..hydrophobicFeatures = json["hydrophobicFeatures"] as int?
      ..polarSurfaceAreaAng = json["polarSurfaceAreaAng"] as double?
      ..logP = json['logP'] as double?
      ..pathTo2DStructure = json["pathTo2DStructure"] as String?
      ..pathToSDF = json["pathToSDF"] as String?

      // Protein and Ligand
      ..pathTo3DStructure = json["pathTo3DStructure"] as String?;
  
  }
}