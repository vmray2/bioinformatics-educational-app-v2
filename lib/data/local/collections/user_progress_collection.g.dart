// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_progress_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserProgressCollectionCollection on Isar {
  IsarCollection<UserProgressCollection> get userProgressCollections =>
      this.collection();
}

const UserProgressCollectionSchema = CollectionSchema(
  name: r'UserProgressCollection',
  id: 3539514917695400353,
  properties: {
    r'activities': PropertySchema(
      id: 0,
      name: r'activities',
      type: IsarType.objectList,

      target: r'IsarActivityEntry',
    ),
    r'badges': PropertySchema(
      id: 1,
      name: r'badges',
      type: IsarType.objectList,

      target: r'IsarBadgeEntry',
    ),
    r'moduleSteps': PropertySchema(
      id: 2,
      name: r'moduleSteps',
      type: IsarType.objectList,

      target: r'IsarModuleStepEntry',
    ),
    r'modules': PropertySchema(
      id: 3,
      name: r'modules',
      type: IsarType.objectList,

      target: r'IsarModuleEntry',
    ),
    r'unlockedActivities': PropertySchema(
      id: 4,
      name: r'unlockedActivities',
      type: IsarType.stringList,
    ),
    r'unlockedBadges': PropertySchema(
      id: 5,
      name: r'unlockedBadges',
      type: IsarType.stringList,
    ),
    r'unlockedModules': PropertySchema(
      id: 6,
      name: r'unlockedModules',
      type: IsarType.stringList,
    ),
  },

  estimateSize: _userProgressCollectionEstimateSize,
  serialize: _userProgressCollectionSerialize,
  deserialize: _userProgressCollectionDeserialize,
  deserializeProp: _userProgressCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'IsarModuleEntry': IsarModuleEntrySchema,
    r'IsarModuleStepEntry': IsarModuleStepEntrySchema,
    r'IsarActivityEntry': IsarActivityEntrySchema,
    r'IsarBadgeEntry': IsarBadgeEntrySchema,
  },

  getId: _userProgressCollectionGetId,
  getLinks: _userProgressCollectionGetLinks,
  attach: _userProgressCollectionAttach,
  version: '3.3.2',
);

int _userProgressCollectionEstimateSize(
  UserProgressCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.activities.length * 3;
  {
    final offsets = allOffsets[IsarActivityEntry]!;
    for (var i = 0; i < object.activities.length; i++) {
      final value = object.activities[i];
      bytesCount += IsarActivityEntrySchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  bytesCount += 3 + object.badges.length * 3;
  {
    final offsets = allOffsets[IsarBadgeEntry]!;
    for (var i = 0; i < object.badges.length; i++) {
      final value = object.badges[i];
      bytesCount += IsarBadgeEntrySchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  bytesCount += 3 + object.moduleSteps.length * 3;
  {
    final offsets = allOffsets[IsarModuleStepEntry]!;
    for (var i = 0; i < object.moduleSteps.length; i++) {
      final value = object.moduleSteps[i];
      bytesCount += IsarModuleStepEntrySchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  bytesCount += 3 + object.modules.length * 3;
  {
    final offsets = allOffsets[IsarModuleEntry]!;
    for (var i = 0; i < object.modules.length; i++) {
      final value = object.modules[i];
      bytesCount += IsarModuleEntrySchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  bytesCount += 3 + object.unlockedActivities.length * 3;
  {
    for (var i = 0; i < object.unlockedActivities.length; i++) {
      final value = object.unlockedActivities[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.unlockedBadges.length * 3;
  {
    for (var i = 0; i < object.unlockedBadges.length; i++) {
      final value = object.unlockedBadges[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.unlockedModules.length * 3;
  {
    for (var i = 0; i < object.unlockedModules.length; i++) {
      final value = object.unlockedModules[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _userProgressCollectionSerialize(
  UserProgressCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<IsarActivityEntry>(
    offsets[0],
    allOffsets,
    IsarActivityEntrySchema.serialize,
    object.activities,
  );
  writer.writeObjectList<IsarBadgeEntry>(
    offsets[1],
    allOffsets,
    IsarBadgeEntrySchema.serialize,
    object.badges,
  );
  writer.writeObjectList<IsarModuleStepEntry>(
    offsets[2],
    allOffsets,
    IsarModuleStepEntrySchema.serialize,
    object.moduleSteps,
  );
  writer.writeObjectList<IsarModuleEntry>(
    offsets[3],
    allOffsets,
    IsarModuleEntrySchema.serialize,
    object.modules,
  );
  writer.writeStringList(offsets[4], object.unlockedActivities);
  writer.writeStringList(offsets[5], object.unlockedBadges);
  writer.writeStringList(offsets[6], object.unlockedModules);
}

UserProgressCollection _userProgressCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserProgressCollection();
  object.activities =
      reader.readObjectList<IsarActivityEntry>(
        offsets[0],
        IsarActivityEntrySchema.deserialize,
        allOffsets,
        IsarActivityEntry(),
      ) ??
      [];
  object.badges =
      reader.readObjectList<IsarBadgeEntry>(
        offsets[1],
        IsarBadgeEntrySchema.deserialize,
        allOffsets,
        IsarBadgeEntry(),
      ) ??
      [];
  object.id = id;
  object.moduleSteps =
      reader.readObjectList<IsarModuleStepEntry>(
        offsets[2],
        IsarModuleStepEntrySchema.deserialize,
        allOffsets,
        IsarModuleStepEntry(),
      ) ??
      [];
  object.modules =
      reader.readObjectList<IsarModuleEntry>(
        offsets[3],
        IsarModuleEntrySchema.deserialize,
        allOffsets,
        IsarModuleEntry(),
      ) ??
      [];
  object.unlockedActivities = reader.readStringList(offsets[4]) ?? [];
  object.unlockedBadges = reader.readStringList(offsets[5]) ?? [];
  object.unlockedModules = reader.readStringList(offsets[6]) ?? [];
  return object;
}

P _userProgressCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<IsarActivityEntry>(
                offset,
                IsarActivityEntrySchema.deserialize,
                allOffsets,
                IsarActivityEntry(),
              ) ??
              [])
          as P;
    case 1:
      return (reader.readObjectList<IsarBadgeEntry>(
                offset,
                IsarBadgeEntrySchema.deserialize,
                allOffsets,
                IsarBadgeEntry(),
              ) ??
              [])
          as P;
    case 2:
      return (reader.readObjectList<IsarModuleStepEntry>(
                offset,
                IsarModuleStepEntrySchema.deserialize,
                allOffsets,
                IsarModuleStepEntry(),
              ) ??
              [])
          as P;
    case 3:
      return (reader.readObjectList<IsarModuleEntry>(
                offset,
                IsarModuleEntrySchema.deserialize,
                allOffsets,
                IsarModuleEntry(),
              ) ??
              [])
          as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userProgressCollectionGetId(UserProgressCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userProgressCollectionGetLinks(
  UserProgressCollection object,
) {
  return [];
}

void _userProgressCollectionAttach(
  IsarCollection<dynamic> col,
  Id id,
  UserProgressCollection object,
) {
  object.id = id;
}

extension UserProgressCollectionQueryWhereSort
    on QueryBuilder<UserProgressCollection, UserProgressCollection, QWhere> {
  QueryBuilder<UserProgressCollection, UserProgressCollection, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserProgressCollectionQueryWhere
    on
        QueryBuilder<
          UserProgressCollection,
          UserProgressCollection,
          QWhereClause
        > {
  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterWhereClause
  >
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

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterWhereClause
  >
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterWhereClause
  >
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterWhereClause
  >
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
}

extension UserProgressCollectionQueryFilter
    on
        QueryBuilder<
          UserProgressCollection,
          UserProgressCollection,
          QFilterCondition
        > {
  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  activitiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'activities', length, true, length, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  activitiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'activities', 0, true, 0, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  activitiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'activities', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  activitiesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'activities', 0, true, length, include);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  activitiesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'activities', length, include, 999999, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  activitiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activities',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  badgesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'badges', length, true, length, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  badgesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'badges', 0, true, 0, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  badgesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'badges', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  badgesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'badges', 0, true, length, include);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  badgesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'badges', length, include, 999999, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  badgesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'badges',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  moduleStepsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'moduleSteps', length, true, length, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  moduleStepsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'moduleSteps', 0, true, 0, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  moduleStepsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'moduleSteps', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  moduleStepsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'moduleSteps', 0, true, length, include);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  moduleStepsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'moduleSteps', length, include, 999999, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  moduleStepsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moduleSteps',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  modulesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'modules', length, true, length, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  modulesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'modules', 0, true, 0, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  modulesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'modules', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  modulesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'modules', 0, true, length, include);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  modulesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'modules', length, include, 999999, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  modulesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'modules',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedActivitiesElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'unlockedActivities',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedActivitiesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'unlockedActivities',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedActivitiesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'unlockedActivities',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedActivitiesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'unlockedActivities',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedActivitiesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'unlockedActivities',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedActivitiesElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'unlockedActivities',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedActivitiesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'unlockedActivities',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedActivitiesElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'unlockedActivities',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedActivitiesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'unlockedActivities', value: ''),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedActivitiesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'unlockedActivities', value: ''),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedActivitiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unlockedActivities',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedActivitiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'unlockedActivities', 0, true, 0, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedActivitiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'unlockedActivities', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedActivitiesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'unlockedActivities', 0, true, length, include);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedActivitiesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unlockedActivities',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedActivitiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unlockedActivities',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedBadgesElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'unlockedBadges',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedBadgesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'unlockedBadges',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedBadgesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'unlockedBadges',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedBadgesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'unlockedBadges',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedBadgesElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'unlockedBadges',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedBadgesElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'unlockedBadges',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedBadgesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'unlockedBadges',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedBadgesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'unlockedBadges',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedBadgesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'unlockedBadges', value: ''),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedBadgesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'unlockedBadges', value: ''),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedBadgesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'unlockedBadges', length, true, length, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedBadgesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'unlockedBadges', 0, true, 0, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedBadgesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'unlockedBadges', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedBadgesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'unlockedBadges', 0, true, length, include);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedBadgesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'unlockedBadges', length, include, 999999, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedBadgesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unlockedBadges',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedModulesElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'unlockedModules',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedModulesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'unlockedModules',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedModulesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'unlockedModules',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedModulesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'unlockedModules',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedModulesElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'unlockedModules',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedModulesElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'unlockedModules',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedModulesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'unlockedModules',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedModulesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'unlockedModules',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedModulesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'unlockedModules', value: ''),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedModulesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'unlockedModules', value: ''),
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedModulesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'unlockedModules', length, true, length, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedModulesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'unlockedModules', 0, true, 0, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedModulesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'unlockedModules', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedModulesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'unlockedModules', 0, true, length, include);
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedModulesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unlockedModules',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  unlockedModulesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'unlockedModules',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension UserProgressCollectionQueryObject
    on
        QueryBuilder<
          UserProgressCollection,
          UserProgressCollection,
          QFilterCondition
        > {
  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  activitiesElement(FilterQuery<IsarActivityEntry> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'activities');
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  badgesElement(FilterQuery<IsarBadgeEntry> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'badges');
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  moduleStepsElement(FilterQuery<IsarModuleStepEntry> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'moduleSteps');
    });
  }

  QueryBuilder<
    UserProgressCollection,
    UserProgressCollection,
    QAfterFilterCondition
  >
  modulesElement(FilterQuery<IsarModuleEntry> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'modules');
    });
  }
}

extension UserProgressCollectionQueryLinks
    on
        QueryBuilder<
          UserProgressCollection,
          UserProgressCollection,
          QFilterCondition
        > {}

extension UserProgressCollectionQuerySortBy
    on QueryBuilder<UserProgressCollection, UserProgressCollection, QSortBy> {}

extension UserProgressCollectionQuerySortThenBy
    on
        QueryBuilder<
          UserProgressCollection,
          UserProgressCollection,
          QSortThenBy
        > {
  QueryBuilder<UserProgressCollection, UserProgressCollection, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserProgressCollection, UserProgressCollection, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension UserProgressCollectionQueryWhereDistinct
    on QueryBuilder<UserProgressCollection, UserProgressCollection, QDistinct> {
  QueryBuilder<UserProgressCollection, UserProgressCollection, QDistinct>
  distinctByUnlockedActivities() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedActivities');
    });
  }

  QueryBuilder<UserProgressCollection, UserProgressCollection, QDistinct>
  distinctByUnlockedBadges() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedBadges');
    });
  }

  QueryBuilder<UserProgressCollection, UserProgressCollection, QDistinct>
  distinctByUnlockedModules() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedModules');
    });
  }
}

extension UserProgressCollectionQueryProperty
    on
        QueryBuilder<
          UserProgressCollection,
          UserProgressCollection,
          QQueryProperty
        > {
  QueryBuilder<UserProgressCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<
    UserProgressCollection,
    List<IsarActivityEntry>,
    QQueryOperations
  >
  activitiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activities');
    });
  }

  QueryBuilder<UserProgressCollection, List<IsarBadgeEntry>, QQueryOperations>
  badgesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'badges');
    });
  }

  QueryBuilder<
    UserProgressCollection,
    List<IsarModuleStepEntry>,
    QQueryOperations
  >
  moduleStepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moduleSteps');
    });
  }

  QueryBuilder<UserProgressCollection, List<IsarModuleEntry>, QQueryOperations>
  modulesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modules');
    });
  }

  QueryBuilder<UserProgressCollection, List<String>, QQueryOperations>
  unlockedActivitiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedActivities');
    });
  }

  QueryBuilder<UserProgressCollection, List<String>, QQueryOperations>
  unlockedBadgesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedBadges');
    });
  }

  QueryBuilder<UserProgressCollection, List<String>, QQueryOperations>
  unlockedModulesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedModules');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarModuleEntrySchema = Schema(
  name: r'IsarModuleEntry',
  id: -6668761972942237448,
  properties: {
    r'lastAccessed': PropertySchema(
      id: 0,
      name: r'lastAccessed',
      type: IsarType.dateTime,
    ),
    r'moduleId': PropertySchema(
      id: 1,
      name: r'moduleId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(id: 2, name: r'status', type: IsarType.long),
  },

  estimateSize: _isarModuleEntryEstimateSize,
  serialize: _isarModuleEntrySerialize,
  deserialize: _isarModuleEntryDeserialize,
  deserializeProp: _isarModuleEntryDeserializeProp,
);

int _isarModuleEntryEstimateSize(
  IsarModuleEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.moduleId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarModuleEntrySerialize(
  IsarModuleEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.lastAccessed);
  writer.writeString(offsets[1], object.moduleId);
  writer.writeLong(offsets[2], object.status);
}

IsarModuleEntry _isarModuleEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarModuleEntry();
  object.lastAccessed = reader.readDateTimeOrNull(offsets[0]);
  object.moduleId = reader.readStringOrNull(offsets[1]);
  object.status = reader.readLong(offsets[2]);
  return object;
}

P _isarModuleEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarModuleEntryQueryFilter
    on QueryBuilder<IsarModuleEntry, IsarModuleEntry, QFilterCondition> {
  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  lastAccessedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastAccessed'),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  lastAccessedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastAccessed'),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  lastAccessedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastAccessed', value: value),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  lastAccessedGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastAccessed',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  lastAccessedLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastAccessed',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  lastAccessedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastAccessed',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  moduleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'moduleId'),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  moduleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'moduleId'),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  moduleIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'moduleId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  moduleIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'moduleId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  moduleIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'moduleId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  moduleIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'moduleId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  moduleIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'moduleId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  moduleIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'moduleId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  moduleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'moduleId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  moduleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'moduleId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  moduleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'moduleId', value: ''),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  moduleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'moduleId', value: ''),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  statusEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: value),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  statusGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  statusLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleEntry, IsarModuleEntry, QAfterFilterCondition>
  statusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension IsarModuleEntryQueryObject
    on QueryBuilder<IsarModuleEntry, IsarModuleEntry, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarModuleStepEntrySchema = Schema(
  name: r'IsarModuleStepEntry',
  id: -4050500083259595878,
  properties: {
    r'isCompleted': PropertySchema(
      id: 0,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'lastAccessed': PropertySchema(
      id: 1,
      name: r'lastAccessed',
      type: IsarType.dateTime,
    ),
    r'moduleStepId': PropertySchema(
      id: 2,
      name: r'moduleStepId',
      type: IsarType.string,
    ),
  },

  estimateSize: _isarModuleStepEntryEstimateSize,
  serialize: _isarModuleStepEntrySerialize,
  deserialize: _isarModuleStepEntryDeserialize,
  deserializeProp: _isarModuleStepEntryDeserializeProp,
);

int _isarModuleStepEntryEstimateSize(
  IsarModuleStepEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.moduleStepId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarModuleStepEntrySerialize(
  IsarModuleStepEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isCompleted);
  writer.writeDateTime(offsets[1], object.lastAccessed);
  writer.writeString(offsets[2], object.moduleStepId);
}

IsarModuleStepEntry _isarModuleStepEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarModuleStepEntry();
  object.isCompleted = reader.readBool(offsets[0]);
  object.lastAccessed = reader.readDateTimeOrNull(offsets[1]);
  object.moduleStepId = reader.readStringOrNull(offsets[2]);
  return object;
}

P _isarModuleStepEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarModuleStepEntryQueryFilter
    on
        QueryBuilder<
          IsarModuleStepEntry,
          IsarModuleStepEntry,
          QFilterCondition
        > {
  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isCompleted', value: value),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  lastAccessedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastAccessed'),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  lastAccessedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastAccessed'),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  lastAccessedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastAccessed', value: value),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  lastAccessedGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastAccessed',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  lastAccessedLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastAccessed',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  lastAccessedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastAccessed',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  moduleStepIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'moduleStepId'),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  moduleStepIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'moduleStepId'),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  moduleStepIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'moduleStepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  moduleStepIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'moduleStepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  moduleStepIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'moduleStepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  moduleStepIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'moduleStepId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  moduleStepIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'moduleStepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  moduleStepIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'moduleStepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  moduleStepIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'moduleStepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  moduleStepIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'moduleStepId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  moduleStepIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'moduleStepId', value: ''),
      );
    });
  }

  QueryBuilder<IsarModuleStepEntry, IsarModuleStepEntry, QAfterFilterCondition>
  moduleStepIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'moduleStepId', value: ''),
      );
    });
  }
}

extension IsarModuleStepEntryQueryObject
    on
        QueryBuilder<
          IsarModuleStepEntry,
          IsarModuleStepEntry,
          QFilterCondition
        > {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarActivityEntrySchema = Schema(
  name: r'IsarActivityEntry',
  id: -8617293132458152501,
  properties: {
    r'activityId': PropertySchema(
      id: 0,
      name: r'activityId',
      type: IsarType.string,
    ),
    r'isCompleted': PropertySchema(
      id: 1,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'lastAccessed': PropertySchema(
      id: 2,
      name: r'lastAccessed',
      type: IsarType.dateTime,
    ),
    r'minMistakes': PropertySchema(
      id: 3,
      name: r'minMistakes',
      type: IsarType.long,
    ),
    r'timesCompleted': PropertySchema(
      id: 4,
      name: r'timesCompleted',
      type: IsarType.long,
    ),
  },

  estimateSize: _isarActivityEntryEstimateSize,
  serialize: _isarActivityEntrySerialize,
  deserialize: _isarActivityEntryDeserialize,
  deserializeProp: _isarActivityEntryDeserializeProp,
);

int _isarActivityEntryEstimateSize(
  IsarActivityEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.activityId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarActivityEntrySerialize(
  IsarActivityEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.activityId);
  writer.writeBool(offsets[1], object.isCompleted);
  writer.writeDateTime(offsets[2], object.lastAccessed);
  writer.writeLong(offsets[3], object.minMistakes);
  writer.writeLong(offsets[4], object.timesCompleted);
}

IsarActivityEntry _isarActivityEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarActivityEntry();
  object.activityId = reader.readStringOrNull(offsets[0]);
  object.isCompleted = reader.readBool(offsets[1]);
  object.lastAccessed = reader.readDateTimeOrNull(offsets[2]);
  object.minMistakes = reader.readLong(offsets[3]);
  object.timesCompleted = reader.readLong(offsets[4]);
  return object;
}

P _isarActivityEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarActivityEntryQueryFilter
    on QueryBuilder<IsarActivityEntry, IsarActivityEntry, QFilterCondition> {
  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  activityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'activityId'),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  activityIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'activityId'),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  activityIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'activityId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  activityIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'activityId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  activityIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'activityId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  activityIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'activityId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  activityIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'activityId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  activityIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'activityId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  activityIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'activityId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  activityIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'activityId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  activityIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'activityId', value: ''),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  activityIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'activityId', value: ''),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isCompleted', value: value),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  lastAccessedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastAccessed'),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  lastAccessedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastAccessed'),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  lastAccessedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastAccessed', value: value),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  lastAccessedGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastAccessed',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  lastAccessedLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastAccessed',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  lastAccessedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastAccessed',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  minMistakesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'minMistakes', value: value),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  minMistakesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'minMistakes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  minMistakesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'minMistakes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  minMistakesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'minMistakes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  timesCompletedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timesCompleted', value: value),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  timesCompletedGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timesCompleted',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  timesCompletedLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timesCompleted',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarActivityEntry, IsarActivityEntry, QAfterFilterCondition>
  timesCompletedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timesCompleted',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension IsarActivityEntryQueryObject
    on QueryBuilder<IsarActivityEntry, IsarActivityEntry, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarBadgeEntrySchema = Schema(
  name: r'IsarBadgeEntry',
  id: -5507491533782320827,
  properties: {
    r'badgeId': PropertySchema(id: 0, name: r'badgeId', type: IsarType.string),
    r'dateUnlocked': PropertySchema(
      id: 1,
      name: r'dateUnlocked',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _isarBadgeEntryEstimateSize,
  serialize: _isarBadgeEntrySerialize,
  deserialize: _isarBadgeEntryDeserialize,
  deserializeProp: _isarBadgeEntryDeserializeProp,
);

int _isarBadgeEntryEstimateSize(
  IsarBadgeEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.badgeId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarBadgeEntrySerialize(
  IsarBadgeEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.badgeId);
  writer.writeDateTime(offsets[1], object.dateUnlocked);
}

IsarBadgeEntry _isarBadgeEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarBadgeEntry();
  object.badgeId = reader.readStringOrNull(offsets[0]);
  object.dateUnlocked = reader.readDateTimeOrNull(offsets[1]);
  return object;
}

P _isarBadgeEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarBadgeEntryQueryFilter
    on QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QFilterCondition> {
  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  badgeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'badgeId'),
      );
    });
  }

  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  badgeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'badgeId'),
      );
    });
  }

  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  badgeIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'badgeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  badgeIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'badgeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  badgeIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'badgeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  badgeIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'badgeId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  badgeIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'badgeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  badgeIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'badgeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  badgeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'badgeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  badgeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'badgeId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  badgeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'badgeId', value: ''),
      );
    });
  }

  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  badgeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'badgeId', value: ''),
      );
    });
  }

  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  dateUnlockedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dateUnlocked'),
      );
    });
  }

  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  dateUnlockedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dateUnlocked'),
      );
    });
  }

  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  dateUnlockedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dateUnlocked', value: value),
      );
    });
  }

  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  dateUnlockedGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dateUnlocked',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  dateUnlockedLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dateUnlocked',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QAfterFilterCondition>
  dateUnlockedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dateUnlocked',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension IsarBadgeEntryQueryObject
    on QueryBuilder<IsarBadgeEntry, IsarBadgeEntry, QFilterCondition> {}
