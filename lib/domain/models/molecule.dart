enum MoleculeType {gene, protein, ligand}

sealed class Molecule {
  final String id;
  final String moleculeId;
  final String name;
  final MoleculeType type;
  final String? description;
  final List<String> synonyms;

  const Molecule({
    required this.id,
    required this.name,
    required this.type,
    this.description,
    this.synonyms = const [], 
    required this.moleculeId
  });
}

class GeneMolecule extends Molecule {
  final String chromosome;
  final int startPosition;
  final int endPosition;
  final String? strand;
  final String? organism;
  final int? exonCount;
  final String? cytogeneticBand;
  final String? fullName;
  String? pathToFasta;

  GeneMolecule({
    required super.id, 
    required super.name,
    required super.moleculeId, 
    super.description,
    super.synonyms,
    required this.chromosome, 
    required this.startPosition, 
    required this.endPosition, 
    required this.strand, 
    required this.organism, 
    required this.exonCount, 
    required this.cytogeneticBand, 
    required this.fullName,
    this.pathToFasta, 
  }) : super(type: MoleculeType.gene);
  
  factory GeneMolecule.fromJson(Map<String, dynamic> json) {
    return GeneMolecule(
      id: json["id"] as String, 
      moleculeId: json["moleculeId"] as String,
      name: json["name"] as String, 
      chromosome: json["chromosome"] as String, 
      startPosition: json["startPosition"] as int, 
      endPosition: json["endPosition"] as int, 
      strand: json["strand"] as String, 
      organism: json["organism"] as String, 
      exonCount: json["exonCount"] as int, 
      cytogeneticBand: json["cytogeneticBand"] as String, 
      fullName: json["fullName"] as String,
      pathToFasta: json["pathToFasta"] as String? ?? ""
    );
  }
}

class ProteinMolecule extends Molecule {
  final String pdbId;
  final String structureName;
  final String? primaryFunction;
  final int? atomCount;
  final int? aminoAcidLength;
  final double? molecularWeightkDa;
  final String? organism;
  String? pathTo3DStructure;
  String? pathToFasta;

  ProteinMolecule({
    required super.id, 
    required super.name, 
    required super.moleculeId, 
    super.description,
    super.synonyms,
    required this.structureName, 
    this.atomCount, 
    required this.aminoAcidLength, 
    required this.molecularWeightkDa, 
    required this.organism,
    this.pathTo3DStructure,
    this.pathToFasta, 
    required this.primaryFunction, 
    required this.pdbId
  }) : super(type: MoleculeType.protein);

  factory ProteinMolecule.fromJson(Map<String, dynamic> json) {
    return ProteinMolecule(
      id: json["id"] as String, 
      moleculeId: json["moleculeId"] as String,
      name: json["name"] as String, 
      structureName: json["structureName"] as String, 
      atomCount: json["atomCount"] as int?, 
      aminoAcidLength: json["aminoAcidLength"] as int, 
      molecularWeightkDa: json["molecularWeightkDa"] as double, 
      organism: json["organism"] as String, 
      primaryFunction: json["primaryFunction"] as String?, 
      pdbId: json["pdbId"] as String,
      pathTo3DStructure: json["pathTo3DStructure"] as String? ?? "",
      pathToFasta: json["pathToFasta"] as String? ?? ""
    );
  }
}

class LigandMolecule extends Molecule {
  final String? pubChemId;
  final String chemicalFormula;
  final int? rotatableBonds;
  final double? polarSurfaceAreaAng;
  final String? smiles;
  final double? molecularWeight;
  final int? hydrogenBondDonors;
  final double? logP;
  final int? hydrogenBondAcceptors;
  String? pathTo2DStructure;
  String? pathTo3DStructure;
  String? pathToSDF;

  LigandMolecule({
    required super.id, 
    required super.name,
    required super.moleculeId, 
    super.description,
    super.synonyms,
    this.pubChemId, 
    required this.chemicalFormula, 
    required this.rotatableBonds, 
    required this.polarSurfaceAreaAng, 
    required this.smiles, 
    required this.molecularWeight, 
    required this.hydrogenBondDonors, 
    required this.logP, 
    required this.hydrogenBondAcceptors,
    this.pathTo2DStructure,
    this.pathTo3DStructure,
    this.pathToSDF
  }) : super(type: MoleculeType.ligand);

  factory LigandMolecule.fromJson(Map<String, dynamic> json) {
    return LigandMolecule(
      id: json["id"] as String, 
      moleculeId: json["moleculeId"] as String,
      name: json["name"] as String, 
      chemicalFormula: json["chemicalFormula"] as String, 
      rotatableBonds: json["rotatableBonds"] as int, 
      polarSurfaceAreaAng: json["polarSurfaceAreaAng"] as double, 
      smiles: json["smiles"] as String, 
      molecularWeight: json["molecularWeight"] as double, 
      hydrogenBondDonors: json["hydrogenBondDonors"] as int, 
      logP: json["logP"] as double, 
      hydrogenBondAcceptors: json["hydrogenBondAcceptors"] as int,
      pubChemId: json["pubChemId"] as String?,
      pathTo2DStructure: json["pathTo2DStructure"] as String? ?? "",
      pathTo3DStructure: json["pathTo3DStructure"] as String? ?? "",
      pathToSDF: json["pathToSDF"] as String? ?? "" 
    );
  }
}