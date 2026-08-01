// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: experimental_member_use

part of 'molecule_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMoleculeCollectionCollection on Isar {
  IsarCollection<MoleculeCollection> get moleculeCollections =>
      this.collection();
}

const MoleculeCollectionSchema = CollectionSchema(
  name: r'MoleculeCollection',
  id: -7012076756419584260,
  properties: {
    r'aminoAcidLength': PropertySchema(
      id: 0,
      name: r'aminoAcidLength',
      type: IsarType.long,
    ),
    r'atomCount': PropertySchema(
      id: 1,
      name: r'atomCount',
      type: IsarType.long,
    ),
    r'chemicalFormula': PropertySchema(
      id: 2,
      name: r'chemicalFormula',
      type: IsarType.string,
    ),
    r'chromosome': PropertySchema(
      id: 3,
      name: r'chromosome',
      type: IsarType.string,
    ),
    r'cytogeneticBand': PropertySchema(
      id: 4,
      name: r'cytogeneticBand',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 5,
      name: r'description',
      type: IsarType.string,
    ),
    r'endPosition': PropertySchema(
      id: 6,
      name: r'endPosition',
      type: IsarType.long,
    ),
    r'exonCount': PropertySchema(
      id: 7,
      name: r'exonCount',
      type: IsarType.long,
    ),
    r'fullName': PropertySchema(
      id: 8,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'hydrogenBondAcceptors': PropertySchema(
      id: 9,
      name: r'hydrogenBondAcceptors',
      type: IsarType.long,
    ),
    r'hydrogenBondDonors': PropertySchema(
      id: 10,
      name: r'hydrogenBondDonors',
      type: IsarType.long,
    ),
    r'localMoleculeId': PropertySchema(
      id: 11,
      name: r'localMoleculeId',
      type: IsarType.string,
    ),
    r'logP': PropertySchema(id: 12, name: r'logP', type: IsarType.double),
    r'molecularWeight': PropertySchema(
      id: 13,
      name: r'molecularWeight',
      type: IsarType.double,
    ),
    r'molecularWeightkDa': PropertySchema(
      id: 14,
      name: r'molecularWeightkDa',
      type: IsarType.double,
    ),
    r'moleculeId': PropertySchema(
      id: 15,
      name: r'moleculeId',
      type: IsarType.string,
    ),
    r'name': PropertySchema(id: 16, name: r'name', type: IsarType.string),
    r'organism': PropertySchema(
      id: 17,
      name: r'organism',
      type: IsarType.string,
    ),
    r'pathTo2DStructure': PropertySchema(
      id: 18,
      name: r'pathTo2DStructure',
      type: IsarType.string,
    ),
    r'pathTo3DStructure': PropertySchema(
      id: 19,
      name: r'pathTo3DStructure',
      type: IsarType.string,
    ),
    r'pathToFasta': PropertySchema(
      id: 20,
      name: r'pathToFasta',
      type: IsarType.string,
    ),
    r'pathToSDF': PropertySchema(
      id: 21,
      name: r'pathToSDF',
      type: IsarType.string,
    ),
    r'pdbId': PropertySchema(id: 22, name: r'pdbId', type: IsarType.string),
    r'polarSurfaceAreaAng': PropertySchema(
      id: 23,
      name: r'polarSurfaceAreaAng',
      type: IsarType.double,
    ),
    r'primaryFunction': PropertySchema(
      id: 24,
      name: r'primaryFunction',
      type: IsarType.string,
    ),
    r'pubChemId': PropertySchema(
      id: 25,
      name: r'pubChemId',
      type: IsarType.string,
    ),
    r'rotatableBonds': PropertySchema(
      id: 26,
      name: r'rotatableBonds',
      type: IsarType.long,
    ),
    r'smiles': PropertySchema(id: 27, name: r'smiles', type: IsarType.string),
    r'startPosition': PropertySchema(
      id: 28,
      name: r'startPosition',
      type: IsarType.long,
    ),
    r'strand': PropertySchema(id: 29, name: r'strand', type: IsarType.string),
    r'structureName': PropertySchema(
      id: 30,
      name: r'structureName',
      type: IsarType.string,
    ),
    r'synonyms': PropertySchema(
      id: 31,
      name: r'synonyms',
      type: IsarType.stringList,
    ),
    r'type': PropertySchema(
      id: 32,
      name: r'type',
      type: IsarType.string,
      enumMap: _MoleculeCollectiontypeEnumValueMap,
    ),
  },

  estimateSize: _moleculeCollectionEstimateSize,
  serialize: _moleculeCollectionSerialize,
  deserialize: _moleculeCollectionDeserialize,
  deserializeProp: _moleculeCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'moleculeId': IndexSchema(
      id: -8901641370400385858,
      name: r'moleculeId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'moleculeId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _moleculeCollectionGetId,
  getLinks: _moleculeCollectionGetLinks,
  attach: _moleculeCollectionAttach,
  version: '3.3.2',
);

int _moleculeCollectionEstimateSize(
  MoleculeCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.chemicalFormula;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.chromosome;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cytogeneticBand;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fullName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.localMoleculeId.length * 3;
  bytesCount += 3 + object.moleculeId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.organism;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pathTo2DStructure;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pathTo3DStructure;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pathToFasta;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pathToSDF;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pdbId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.primaryFunction;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pubChemId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.smiles;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.strand;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.structureName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.synonyms.length * 3;
  {
    for (var i = 0; i < object.synonyms.length; i++) {
      final value = object.synonyms[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _moleculeCollectionSerialize(
  MoleculeCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.aminoAcidLength);
  writer.writeLong(offsets[1], object.atomCount);
  writer.writeString(offsets[2], object.chemicalFormula);
  writer.writeString(offsets[3], object.chromosome);
  writer.writeString(offsets[4], object.cytogeneticBand);
  writer.writeString(offsets[5], object.description);
  writer.writeLong(offsets[6], object.endPosition);
  writer.writeLong(offsets[7], object.exonCount);
  writer.writeString(offsets[8], object.fullName);
  writer.writeLong(offsets[9], object.hydrogenBondAcceptors);
  writer.writeLong(offsets[10], object.hydrogenBondDonors);
  writer.writeString(offsets[11], object.localMoleculeId);
  writer.writeDouble(offsets[12], object.logP);
  writer.writeDouble(offsets[13], object.molecularWeight);
  writer.writeDouble(offsets[14], object.molecularWeightkDa);
  writer.writeString(offsets[15], object.moleculeId);
  writer.writeString(offsets[16], object.name);
  writer.writeString(offsets[17], object.organism);
  writer.writeString(offsets[18], object.pathTo2DStructure);
  writer.writeString(offsets[19], object.pathTo3DStructure);
  writer.writeString(offsets[20], object.pathToFasta);
  writer.writeString(offsets[21], object.pathToSDF);
  writer.writeString(offsets[22], object.pdbId);
  writer.writeDouble(offsets[23], object.polarSurfaceAreaAng);
  writer.writeString(offsets[24], object.primaryFunction);
  writer.writeString(offsets[25], object.pubChemId);
  writer.writeLong(offsets[26], object.rotatableBonds);
  writer.writeString(offsets[27], object.smiles);
  writer.writeLong(offsets[28], object.startPosition);
  writer.writeString(offsets[29], object.strand);
  writer.writeString(offsets[30], object.structureName);
  writer.writeStringList(offsets[31], object.synonyms);
  writer.writeString(offsets[32], object.type.name);
}

MoleculeCollection _moleculeCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoleculeCollection();
  object.aminoAcidLength = reader.readLongOrNull(offsets[0]);
  object.atomCount = reader.readLongOrNull(offsets[1]);
  object.chemicalFormula = reader.readStringOrNull(offsets[2]);
  object.chromosome = reader.readStringOrNull(offsets[3]);
  object.cytogeneticBand = reader.readStringOrNull(offsets[4]);
  object.description = reader.readStringOrNull(offsets[5]);
  object.endPosition = reader.readLongOrNull(offsets[6]);
  object.exonCount = reader.readLongOrNull(offsets[7]);
  object.fullName = reader.readStringOrNull(offsets[8]);
  object.hydrogenBondAcceptors = reader.readLongOrNull(offsets[9]);
  object.hydrogenBondDonors = reader.readLongOrNull(offsets[10]);
  object.id = id;
  object.localMoleculeId = reader.readString(offsets[11]);
  object.logP = reader.readDoubleOrNull(offsets[12]);
  object.molecularWeight = reader.readDoubleOrNull(offsets[13]);
  object.molecularWeightkDa = reader.readDoubleOrNull(offsets[14]);
  object.moleculeId = reader.readString(offsets[15]);
  object.name = reader.readString(offsets[16]);
  object.organism = reader.readStringOrNull(offsets[17]);
  object.pathTo2DStructure = reader.readStringOrNull(offsets[18]);
  object.pathTo3DStructure = reader.readStringOrNull(offsets[19]);
  object.pathToFasta = reader.readStringOrNull(offsets[20]);
  object.pathToSDF = reader.readStringOrNull(offsets[21]);
  object.pdbId = reader.readStringOrNull(offsets[22]);
  object.polarSurfaceAreaAng = reader.readDoubleOrNull(offsets[23]);
  object.primaryFunction = reader.readStringOrNull(offsets[24]);
  object.pubChemId = reader.readStringOrNull(offsets[25]);
  object.rotatableBonds = reader.readLongOrNull(offsets[26]);
  object.smiles = reader.readStringOrNull(offsets[27]);
  object.startPosition = reader.readLongOrNull(offsets[28]);
  object.strand = reader.readStringOrNull(offsets[29]);
  object.structureName = reader.readStringOrNull(offsets[30]);
  object.synonyms = reader.readStringList(offsets[31]) ?? [];
  object.type =
      _MoleculeCollectiontypeValueEnumMap[reader.readStringOrNull(
        offsets[32],
      )] ??
      MoleculeType.gene;
  return object;
}

P _moleculeCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readDoubleOrNull(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (reader.readLongOrNull(offset)) as P;
    case 27:
      return (reader.readStringOrNull(offset)) as P;
    case 28:
      return (reader.readLongOrNull(offset)) as P;
    case 29:
      return (reader.readStringOrNull(offset)) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    case 31:
      return (reader.readStringList(offset) ?? []) as P;
    case 32:
      return (_MoleculeCollectiontypeValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              MoleculeType.gene)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MoleculeCollectiontypeEnumValueMap = {
  r'gene': r'gene',
  r'protein': r'protein',
  r'ligand': r'ligand',
};
const _MoleculeCollectiontypeValueEnumMap = {
  r'gene': MoleculeType.gene,
  r'protein': MoleculeType.protein,
  r'ligand': MoleculeType.ligand,
};

Id _moleculeCollectionGetId(MoleculeCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _moleculeCollectionGetLinks(
  MoleculeCollection object,
) {
  return [];
}

void _moleculeCollectionAttach(
  IsarCollection<dynamic> col,
  Id id,
  MoleculeCollection object,
) {
  object.id = id;
}

extension MoleculeCollectionByIndex on IsarCollection<MoleculeCollection> {
  Future<MoleculeCollection?> getByMoleculeId(String moleculeId) {
    return getByIndex(r'moleculeId', [moleculeId]);
  }

  MoleculeCollection? getByMoleculeIdSync(String moleculeId) {
    return getByIndexSync(r'moleculeId', [moleculeId]);
  }

  Future<bool> deleteByMoleculeId(String moleculeId) {
    return deleteByIndex(r'moleculeId', [moleculeId]);
  }

  bool deleteByMoleculeIdSync(String moleculeId) {
    return deleteByIndexSync(r'moleculeId', [moleculeId]);
  }

  Future<List<MoleculeCollection?>> getAllByMoleculeId(
    List<String> moleculeIdValues,
  ) {
    final values = moleculeIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'moleculeId', values);
  }

  List<MoleculeCollection?> getAllByMoleculeIdSync(
    List<String> moleculeIdValues,
  ) {
    final values = moleculeIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'moleculeId', values);
  }

  Future<int> deleteAllByMoleculeId(List<String> moleculeIdValues) {
    final values = moleculeIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'moleculeId', values);
  }

  int deleteAllByMoleculeIdSync(List<String> moleculeIdValues) {
    final values = moleculeIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'moleculeId', values);
  }

  Future<Id> putByMoleculeId(MoleculeCollection object) {
    return putByIndex(r'moleculeId', object);
  }

  Id putByMoleculeIdSync(MoleculeCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'moleculeId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByMoleculeId(List<MoleculeCollection> objects) {
    return putAllByIndex(r'moleculeId', objects);
  }

  List<Id> putAllByMoleculeIdSync(
    List<MoleculeCollection> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'moleculeId', objects, saveLinks: saveLinks);
  }
}

extension MoleculeCollectionQueryWhereSort
    on QueryBuilder<MoleculeCollection, MoleculeCollection, QWhere> {
  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterWhere> anyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'name'),
      );
    });
  }
}

extension MoleculeCollectionQueryWhere
    on QueryBuilder<MoleculeCollection, MoleculeCollection, QWhereClause> {
  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterWhereClause>
  moleculeIdEqualTo(String moleculeId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'moleculeId', value: [moleculeId]),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterWhereClause>
  moleculeIdNotEqualTo(String moleculeId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'moleculeId',
                lower: [],
                upper: [moleculeId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'moleculeId',
                lower: [moleculeId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'moleculeId',
                lower: [moleculeId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'moleculeId',
                lower: [],
                upper: [moleculeId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterWhereClause>
  nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'name', value: [name]),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterWhereClause>
  nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterWhereClause>
  nameGreaterThan(String name, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'name',
          lower: [name],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterWhereClause>
  nameLessThan(String name, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'name',
          lower: [],
          upper: [name],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterWhereClause>
  nameBetween(
    String lowerName,
    String upperName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'name',
          lower: [lowerName],
          includeLower: includeLower,
          upper: [upperName],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterWhereClause>
  nameStartsWith(String NamePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'name',
          lower: [NamePrefix],
          upper: ['$NamePrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterWhereClause>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'name', value: ['']),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterWhereClause>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'name', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'name', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'name', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'name', upper: ['']),
            );
      }
    });
  }
}

extension MoleculeCollectionQueryFilter
    on QueryBuilder<MoleculeCollection, MoleculeCollection, QFilterCondition> {
  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  aminoAcidLengthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'aminoAcidLength'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  aminoAcidLengthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'aminoAcidLength'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  aminoAcidLengthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'aminoAcidLength', value: value),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  aminoAcidLengthGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'aminoAcidLength',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  aminoAcidLengthLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'aminoAcidLength',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  aminoAcidLengthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'aminoAcidLength',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  atomCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'atomCount'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  atomCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'atomCount'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  atomCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'atomCount', value: value),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  atomCountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'atomCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  atomCountLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'atomCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  atomCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'atomCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chemicalFormulaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'chemicalFormula'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chemicalFormulaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'chemicalFormula'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chemicalFormulaEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'chemicalFormula',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chemicalFormulaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'chemicalFormula',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chemicalFormulaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'chemicalFormula',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chemicalFormulaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'chemicalFormula',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chemicalFormulaStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'chemicalFormula',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chemicalFormulaEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'chemicalFormula',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chemicalFormulaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'chemicalFormula',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chemicalFormulaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'chemicalFormula',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chemicalFormulaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'chemicalFormula', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chemicalFormulaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'chemicalFormula', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chromosomeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'chromosome'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chromosomeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'chromosome'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chromosomeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'chromosome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chromosomeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'chromosome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chromosomeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'chromosome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chromosomeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'chromosome',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chromosomeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'chromosome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chromosomeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'chromosome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chromosomeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'chromosome',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chromosomeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'chromosome',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chromosomeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'chromosome', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  chromosomeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'chromosome', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  cytogeneticBandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'cytogeneticBand'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  cytogeneticBandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'cytogeneticBand'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  cytogeneticBandEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'cytogeneticBand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  cytogeneticBandGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cytogeneticBand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  cytogeneticBandLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cytogeneticBand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  cytogeneticBandBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cytogeneticBand',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  cytogeneticBandStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'cytogeneticBand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  cytogeneticBandEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'cytogeneticBand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  cytogeneticBandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'cytogeneticBand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  cytogeneticBandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'cytogeneticBand',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  cytogeneticBandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cytogeneticBand', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  cytogeneticBandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'cytogeneticBand', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'description'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'description'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  descriptionEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  descriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  descriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  endPositionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'endPosition'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  endPositionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'endPosition'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  endPositionEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'endPosition', value: value),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  endPositionGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'endPosition',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  endPositionLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'endPosition',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  endPositionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'endPosition',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  exonCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'exonCount'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  exonCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'exonCount'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  exonCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'exonCount', value: value),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  exonCountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'exonCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  exonCountLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'exonCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  exonCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'exonCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  fullNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fullName'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  fullNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fullName'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  fullNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'fullName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  fullNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'fullName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  fullNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'fullName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  fullNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'fullName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  fullNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'fullName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  fullNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'fullName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  fullNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'fullName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  fullNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'fullName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fullName', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fullName', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  hydrogenBondAcceptorsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'hydrogenBondAcceptors'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  hydrogenBondAcceptorsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'hydrogenBondAcceptors'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  hydrogenBondAcceptorsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'hydrogenBondAcceptors',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  hydrogenBondAcceptorsGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'hydrogenBondAcceptors',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  hydrogenBondAcceptorsLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'hydrogenBondAcceptors',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  hydrogenBondAcceptorsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'hydrogenBondAcceptors',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  hydrogenBondDonorsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'hydrogenBondDonors'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  hydrogenBondDonorsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'hydrogenBondDonors'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  hydrogenBondDonorsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hydrogenBondDonors', value: value),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  hydrogenBondDonorsGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'hydrogenBondDonors',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  hydrogenBondDonorsLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'hydrogenBondDonors',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  hydrogenBondDonorsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'hydrogenBondDonors',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  localMoleculeIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'localMoleculeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  localMoleculeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'localMoleculeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  localMoleculeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'localMoleculeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  localMoleculeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'localMoleculeId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  localMoleculeIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'localMoleculeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  localMoleculeIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'localMoleculeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  localMoleculeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'localMoleculeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  localMoleculeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'localMoleculeId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  localMoleculeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localMoleculeId', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  localMoleculeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'localMoleculeId', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  logPIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'logP'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  logPIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'logP'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  logPEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'logP',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  logPGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'logP',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  logPLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'logP',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  logPBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'logP',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  molecularWeightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'molecularWeight'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  molecularWeightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'molecularWeight'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  molecularWeightEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'molecularWeight',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  molecularWeightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'molecularWeight',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  molecularWeightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'molecularWeight',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  molecularWeightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'molecularWeight',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  molecularWeightkDaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'molecularWeightkDa'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  molecularWeightkDaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'molecularWeightkDa'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  molecularWeightkDaEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'molecularWeightkDa',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  molecularWeightkDaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'molecularWeightkDa',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  molecularWeightkDaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'molecularWeightkDa',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  molecularWeightkDaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'molecularWeightkDa',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  moleculeIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'moleculeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  moleculeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'moleculeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  moleculeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'moleculeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  moleculeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'moleculeId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  moleculeIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'moleculeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  moleculeIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'moleculeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  moleculeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'moleculeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  moleculeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'moleculeId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  moleculeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'moleculeId', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  moleculeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'moleculeId', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  nameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  nameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  organismIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'organism'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  organismIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'organism'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  organismEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'organism',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  organismGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'organism',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  organismLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'organism',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  organismBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'organism',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  organismStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'organism',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  organismEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'organism',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  organismContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'organism',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  organismMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'organism',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  organismIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'organism', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  organismIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'organism', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo2DStructureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pathTo2DStructure'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo2DStructureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pathTo2DStructure'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo2DStructureEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pathTo2DStructure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo2DStructureGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pathTo2DStructure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo2DStructureLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pathTo2DStructure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo2DStructureBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pathTo2DStructure',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo2DStructureStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pathTo2DStructure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo2DStructureEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pathTo2DStructure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo2DStructureContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pathTo2DStructure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo2DStructureMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pathTo2DStructure',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo2DStructureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pathTo2DStructure', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo2DStructureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pathTo2DStructure', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo3DStructureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pathTo3DStructure'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo3DStructureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pathTo3DStructure'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo3DStructureEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pathTo3DStructure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo3DStructureGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pathTo3DStructure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo3DStructureLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pathTo3DStructure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo3DStructureBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pathTo3DStructure',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo3DStructureStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pathTo3DStructure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo3DStructureEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pathTo3DStructure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo3DStructureContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pathTo3DStructure',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo3DStructureMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pathTo3DStructure',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo3DStructureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pathTo3DStructure', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathTo3DStructureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pathTo3DStructure', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToFastaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pathToFasta'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToFastaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pathToFasta'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToFastaEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pathToFasta',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToFastaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pathToFasta',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToFastaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pathToFasta',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToFastaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pathToFasta',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToFastaStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pathToFasta',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToFastaEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pathToFasta',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToFastaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pathToFasta',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToFastaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pathToFasta',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToFastaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pathToFasta', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToFastaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pathToFasta', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToSDFIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pathToSDF'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToSDFIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pathToSDF'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToSDFEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pathToSDF',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToSDFGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pathToSDF',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToSDFLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pathToSDF',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToSDFBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pathToSDF',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToSDFStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pathToSDF',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToSDFEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pathToSDF',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToSDFContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pathToSDF',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToSDFMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pathToSDF',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToSDFIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pathToSDF', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pathToSDFIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pathToSDF', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pdbIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pdbId'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pdbIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pdbId'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pdbIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pdbId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pdbIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pdbId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pdbIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pdbId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pdbIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pdbId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pdbIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pdbId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pdbIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pdbId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pdbIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pdbId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pdbIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pdbId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pdbIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pdbId', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pdbIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pdbId', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  polarSurfaceAreaAngIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'polarSurfaceAreaAng'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  polarSurfaceAreaAngIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'polarSurfaceAreaAng'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  polarSurfaceAreaAngEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'polarSurfaceAreaAng',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  polarSurfaceAreaAngGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'polarSurfaceAreaAng',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  polarSurfaceAreaAngLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'polarSurfaceAreaAng',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  polarSurfaceAreaAngBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'polarSurfaceAreaAng',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  primaryFunctionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'primaryFunction'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  primaryFunctionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'primaryFunction'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  primaryFunctionEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'primaryFunction',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  primaryFunctionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'primaryFunction',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  primaryFunctionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'primaryFunction',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  primaryFunctionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'primaryFunction',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  primaryFunctionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'primaryFunction',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  primaryFunctionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'primaryFunction',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  primaryFunctionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'primaryFunction',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  primaryFunctionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'primaryFunction',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  primaryFunctionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'primaryFunction', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  primaryFunctionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'primaryFunction', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pubChemIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pubChemId'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pubChemIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pubChemId'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pubChemIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pubChemId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pubChemIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pubChemId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pubChemIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pubChemId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pubChemIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pubChemId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pubChemIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pubChemId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pubChemIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pubChemId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pubChemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pubChemId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pubChemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pubChemId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pubChemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pubChemId', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  pubChemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pubChemId', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  rotatableBondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'rotatableBonds'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  rotatableBondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'rotatableBonds'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  rotatableBondsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rotatableBonds', value: value),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  rotatableBondsGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rotatableBonds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  rotatableBondsLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rotatableBonds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  rotatableBondsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rotatableBonds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  smilesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'smiles'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  smilesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'smiles'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  smilesEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'smiles',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  smilesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'smiles',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  smilesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'smiles',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  smilesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'smiles',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  smilesStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'smiles',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  smilesEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'smiles',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  smilesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'smiles',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  smilesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'smiles',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  smilesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'smiles', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  smilesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'smiles', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  startPositionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'startPosition'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  startPositionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'startPosition'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  startPositionEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startPosition', value: value),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  startPositionGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'startPosition',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  startPositionLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'startPosition',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  startPositionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'startPosition',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  strandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'strand'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  strandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'strand'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  strandEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'strand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  strandGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'strand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  strandLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'strand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  strandBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'strand',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  strandStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'strand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  strandEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'strand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  strandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'strand',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  strandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'strand',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  strandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'strand', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  strandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'strand', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  structureNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'structureName'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  structureNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'structureName'),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  structureNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'structureName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  structureNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'structureName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  structureNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'structureName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  structureNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'structureName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  structureNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'structureName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  structureNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'structureName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  structureNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'structureName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  structureNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'structureName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  structureNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'structureName', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  structureNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'structureName', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  synonymsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'synonyms',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  synonymsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'synonyms',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  synonymsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'synonyms',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  synonymsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'synonyms',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  synonymsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'synonyms',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  synonymsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'synonyms',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  synonymsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'synonyms',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  synonymsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'synonyms',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  synonymsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'synonyms', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  synonymsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'synonyms', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  synonymsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'synonyms', length, true, length, true);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  synonymsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'synonyms', 0, true, 0, true);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  synonymsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'synonyms', 0, false, 999999, true);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  synonymsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'synonyms', 0, true, length, include);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  synonymsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'synonyms', length, include, 999999, true);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  synonymsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'synonyms',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  typeEqualTo(MoleculeType value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  typeGreaterThan(
    MoleculeType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  typeLessThan(
    MoleculeType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  typeBetween(
    MoleculeType lower,
    MoleculeType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'type',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  typeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  typeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'type',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterFilterCondition>
  typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'type', value: ''),
      );
    });
  }
}

extension MoleculeCollectionQueryObject
    on QueryBuilder<MoleculeCollection, MoleculeCollection, QFilterCondition> {}

extension MoleculeCollectionQueryLinks
    on QueryBuilder<MoleculeCollection, MoleculeCollection, QFilterCondition> {}

extension MoleculeCollectionQuerySortBy
    on QueryBuilder<MoleculeCollection, MoleculeCollection, QSortBy> {
  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByAminoAcidLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aminoAcidLength', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByAminoAcidLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aminoAcidLength', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByAtomCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atomCount', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByAtomCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atomCount', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByChemicalFormula() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalFormula', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByChemicalFormulaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalFormula', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByChromosome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chromosome', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByChromosomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chromosome', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByCytogeneticBand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cytogeneticBand', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByCytogeneticBandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cytogeneticBand', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByEndPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endPosition', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByEndPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endPosition', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByExonCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exonCount', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByExonCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exonCount', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByHydrogenBondAcceptors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hydrogenBondAcceptors', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByHydrogenBondAcceptorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hydrogenBondAcceptors', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByHydrogenBondDonors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hydrogenBondDonors', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByHydrogenBondDonorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hydrogenBondDonors', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByLocalMoleculeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localMoleculeId', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByLocalMoleculeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localMoleculeId', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByLogP() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logP', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByLogPDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logP', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByMolecularWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'molecularWeight', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByMolecularWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'molecularWeight', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByMolecularWeightkDa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'molecularWeightkDa', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByMolecularWeightkDaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'molecularWeightkDa', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByMoleculeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moleculeId', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByMoleculeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moleculeId', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByOrganism() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organism', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByOrganismDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organism', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByPathTo2DStructure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathTo2DStructure', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByPathTo2DStructureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathTo2DStructure', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByPathTo3DStructure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathTo3DStructure', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByPathTo3DStructureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathTo3DStructure', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByPathToFasta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathToFasta', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByPathToFastaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathToFasta', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByPathToSDF() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathToSDF', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByPathToSDFDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathToSDF', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByPdbId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdbId', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByPdbIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdbId', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByPolarSurfaceAreaAng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'polarSurfaceAreaAng', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByPolarSurfaceAreaAngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'polarSurfaceAreaAng', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByPrimaryFunction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryFunction', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByPrimaryFunctionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryFunction', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByPubChemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubChemId', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByPubChemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubChemId', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByRotatableBonds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rotatableBonds', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByRotatableBondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rotatableBonds', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortBySmiles() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smiles', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortBySmilesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smiles', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByStartPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startPosition', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByStartPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startPosition', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByStrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strand', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByStrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strand', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByStructureName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structureName', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByStructureNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structureName', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension MoleculeCollectionQuerySortThenBy
    on QueryBuilder<MoleculeCollection, MoleculeCollection, QSortThenBy> {
  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByAminoAcidLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aminoAcidLength', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByAminoAcidLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aminoAcidLength', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByAtomCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atomCount', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByAtomCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atomCount', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByChemicalFormula() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalFormula', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByChemicalFormulaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalFormula', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByChromosome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chromosome', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByChromosomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chromosome', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByCytogeneticBand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cytogeneticBand', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByCytogeneticBandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cytogeneticBand', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByEndPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endPosition', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByEndPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endPosition', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByExonCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exonCount', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByExonCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exonCount', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByHydrogenBondAcceptors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hydrogenBondAcceptors', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByHydrogenBondAcceptorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hydrogenBondAcceptors', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByHydrogenBondDonors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hydrogenBondDonors', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByHydrogenBondDonorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hydrogenBondDonors', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByLocalMoleculeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localMoleculeId', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByLocalMoleculeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localMoleculeId', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByLogP() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logP', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByLogPDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logP', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByMolecularWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'molecularWeight', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByMolecularWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'molecularWeight', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByMolecularWeightkDa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'molecularWeightkDa', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByMolecularWeightkDaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'molecularWeightkDa', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByMoleculeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moleculeId', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByMoleculeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moleculeId', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByOrganism() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organism', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByOrganismDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organism', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByPathTo2DStructure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathTo2DStructure', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByPathTo2DStructureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathTo2DStructure', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByPathTo3DStructure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathTo3DStructure', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByPathTo3DStructureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathTo3DStructure', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByPathToFasta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathToFasta', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByPathToFastaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathToFasta', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByPathToSDF() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathToSDF', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByPathToSDFDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathToSDF', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByPdbId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdbId', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByPdbIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdbId', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByPolarSurfaceAreaAng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'polarSurfaceAreaAng', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByPolarSurfaceAreaAngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'polarSurfaceAreaAng', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByPrimaryFunction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryFunction', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByPrimaryFunctionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryFunction', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByPubChemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubChemId', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByPubChemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pubChemId', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByRotatableBonds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rotatableBonds', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByRotatableBondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rotatableBonds', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenBySmiles() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smiles', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenBySmilesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smiles', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByStartPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startPosition', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByStartPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startPosition', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByStrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strand', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByStrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strand', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByStructureName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structureName', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByStructureNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structureName', Sort.desc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QAfterSortBy>
  thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension MoleculeCollectionQueryWhereDistinct
    on QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct> {
  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByAminoAcidLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aminoAcidLength');
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByAtomCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'atomCount');
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByChemicalFormula({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'chemicalFormula',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByChromosome({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chromosome', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByCytogeneticBand({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'cytogeneticBand',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByEndPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endPosition');
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByExonCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exonCount');
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByFullName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByHydrogenBondAcceptors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hydrogenBondAcceptors');
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByHydrogenBondDonors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hydrogenBondDonors');
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByLocalMoleculeId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'localMoleculeId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByLogP() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logP');
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByMolecularWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'molecularWeight');
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByMolecularWeightkDa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'molecularWeightkDa');
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByMoleculeId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'moleculeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByOrganism({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'organism', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByPathTo2DStructure({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'pathTo2DStructure',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByPathTo3DStructure({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'pathTo3DStructure',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByPathToFasta({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pathToFasta', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByPathToSDF({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pathToSDF', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByPdbId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdbId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByPolarSurfaceAreaAng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'polarSurfaceAreaAng');
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByPrimaryFunction({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'primaryFunction',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByPubChemId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pubChemId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByRotatableBonds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rotatableBonds');
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctBySmiles({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smiles', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByStartPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startPosition');
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByStrand({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'strand', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByStructureName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'structureName',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctBySynonyms() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'synonyms');
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeCollection, QDistinct>
  distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension MoleculeCollectionQueryProperty
    on QueryBuilder<MoleculeCollection, MoleculeCollection, QQueryProperty> {
  QueryBuilder<MoleculeCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MoleculeCollection, int?, QQueryOperations>
  aminoAcidLengthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aminoAcidLength');
    });
  }

  QueryBuilder<MoleculeCollection, int?, QQueryOperations> atomCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'atomCount');
    });
  }

  QueryBuilder<MoleculeCollection, String?, QQueryOperations>
  chemicalFormulaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chemicalFormula');
    });
  }

  QueryBuilder<MoleculeCollection, String?, QQueryOperations>
  chromosomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chromosome');
    });
  }

  QueryBuilder<MoleculeCollection, String?, QQueryOperations>
  cytogeneticBandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cytogeneticBand');
    });
  }

  QueryBuilder<MoleculeCollection, String?, QQueryOperations>
  descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<MoleculeCollection, int?, QQueryOperations>
  endPositionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endPosition');
    });
  }

  QueryBuilder<MoleculeCollection, int?, QQueryOperations> exonCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exonCount');
    });
  }

  QueryBuilder<MoleculeCollection, String?, QQueryOperations>
  fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<MoleculeCollection, int?, QQueryOperations>
  hydrogenBondAcceptorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hydrogenBondAcceptors');
    });
  }

  QueryBuilder<MoleculeCollection, int?, QQueryOperations>
  hydrogenBondDonorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hydrogenBondDonors');
    });
  }

  QueryBuilder<MoleculeCollection, String, QQueryOperations>
  localMoleculeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localMoleculeId');
    });
  }

  QueryBuilder<MoleculeCollection, double?, QQueryOperations> logPProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logP');
    });
  }

  QueryBuilder<MoleculeCollection, double?, QQueryOperations>
  molecularWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'molecularWeight');
    });
  }

  QueryBuilder<MoleculeCollection, double?, QQueryOperations>
  molecularWeightkDaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'molecularWeightkDa');
    });
  }

  QueryBuilder<MoleculeCollection, String, QQueryOperations>
  moleculeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moleculeId');
    });
  }

  QueryBuilder<MoleculeCollection, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MoleculeCollection, String?, QQueryOperations>
  organismProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'organism');
    });
  }

  QueryBuilder<MoleculeCollection, String?, QQueryOperations>
  pathTo2DStructureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pathTo2DStructure');
    });
  }

  QueryBuilder<MoleculeCollection, String?, QQueryOperations>
  pathTo3DStructureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pathTo3DStructure');
    });
  }

  QueryBuilder<MoleculeCollection, String?, QQueryOperations>
  pathToFastaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pathToFasta');
    });
  }

  QueryBuilder<MoleculeCollection, String?, QQueryOperations>
  pathToSDFProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pathToSDF');
    });
  }

  QueryBuilder<MoleculeCollection, String?, QQueryOperations> pdbIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdbId');
    });
  }

  QueryBuilder<MoleculeCollection, double?, QQueryOperations>
  polarSurfaceAreaAngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'polarSurfaceAreaAng');
    });
  }

  QueryBuilder<MoleculeCollection, String?, QQueryOperations>
  primaryFunctionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'primaryFunction');
    });
  }

  QueryBuilder<MoleculeCollection, String?, QQueryOperations>
  pubChemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pubChemId');
    });
  }

  QueryBuilder<MoleculeCollection, int?, QQueryOperations>
  rotatableBondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rotatableBonds');
    });
  }

  QueryBuilder<MoleculeCollection, String?, QQueryOperations> smilesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smiles');
    });
  }

  QueryBuilder<MoleculeCollection, int?, QQueryOperations>
  startPositionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startPosition');
    });
  }

  QueryBuilder<MoleculeCollection, String?, QQueryOperations> strandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'strand');
    });
  }

  QueryBuilder<MoleculeCollection, String?, QQueryOperations>
  structureNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'structureName');
    });
  }

  QueryBuilder<MoleculeCollection, List<String>, QQueryOperations>
  synonymsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'synonyms');
    });
  }

  QueryBuilder<MoleculeCollection, MoleculeType, QQueryOperations>
  typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
