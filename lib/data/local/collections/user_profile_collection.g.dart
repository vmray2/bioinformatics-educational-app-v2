// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserProfileCollectionCollection on Isar {
  IsarCollection<UserProfileCollection> get userProfileCollections =>
      this.collection();
}

const UserProfileCollectionSchema = CollectionSchema(
  name: r'UserProfileCollection',
  id: 6604425896111104206,
  properties: {
    r'accountCreated': PropertySchema(
      id: 0,
      name: r'accountCreated',
      type: IsarType.dateTime,
    ),
    r'competencyXp': PropertySchema(
      id: 1,
      name: r'competencyXp',
      type: IsarType.objectList,

      target: r'CompetencyXp',
    ),
    r'consecutiveDays': PropertySchema(
      id: 2,
      name: r'consecutiveDays',
      type: IsarType.long,
    ),
    r'currentLevel': PropertySchema(
      id: 3,
      name: r'currentLevel',
      type: IsarType.long,
    ),
    r'lastActiveSession': PropertySchema(
      id: 4,
      name: r'lastActiveSession',
      type: IsarType.dateTime,
    ),
    r'totalXp': PropertySchema(id: 5, name: r'totalXp', type: IsarType.long),
    r'userTitle': PropertySchema(
      id: 6,
      name: r'userTitle',
      type: IsarType.string,
    ),
    r'username': PropertySchema(
      id: 7,
      name: r'username',
      type: IsarType.string,
    ),
    r'xpForCompletion': PropertySchema(
      id: 8,
      name: r'xpForCompletion',
      type: IsarType.long,
    ),
  },

  estimateSize: _userProfileCollectionEstimateSize,
  serialize: _userProfileCollectionSerialize,
  deserialize: _userProfileCollectionDeserialize,
  deserializeProp: _userProfileCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'CompetencyXp': CompetencyXpSchema},

  getId: _userProfileCollectionGetId,
  getLinks: _userProfileCollectionGetLinks,
  attach: _userProfileCollectionAttach,
  version: '3.3.2',
);

int _userProfileCollectionEstimateSize(
  UserProfileCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.competencyXp.length * 3;
  {
    final offsets = allOffsets[CompetencyXp]!;
    for (var i = 0; i < object.competencyXp.length; i++) {
      final value = object.competencyXp[i];
      bytesCount += CompetencyXpSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.userTitle.length * 3;
  bytesCount += 3 + object.username.length * 3;
  return bytesCount;
}

void _userProfileCollectionSerialize(
  UserProfileCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.accountCreated);
  writer.writeObjectList<CompetencyXp>(
    offsets[1],
    allOffsets,
    CompetencyXpSchema.serialize,
    object.competencyXp,
  );
  writer.writeLong(offsets[2], object.consecutiveDays);
  writer.writeLong(offsets[3], object.currentLevel);
  writer.writeDateTime(offsets[4], object.lastActiveSession);
  writer.writeLong(offsets[5], object.totalXp);
  writer.writeString(offsets[6], object.userTitle);
  writer.writeString(offsets[7], object.username);
  writer.writeLong(offsets[8], object.xpForCompletion);
}

UserProfileCollection _userProfileCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserProfileCollection();
  object.accountCreated = reader.readDateTime(offsets[0]);
  object.competencyXp =
      reader.readObjectList<CompetencyXp>(
        offsets[1],
        CompetencyXpSchema.deserialize,
        allOffsets,
        CompetencyXp(),
      ) ??
      [];
  object.consecutiveDays = reader.readLong(offsets[2]);
  object.currentLevel = reader.readLong(offsets[3]);
  object.id = id;
  object.lastActiveSession = reader.readDateTime(offsets[4]);
  object.totalXp = reader.readLong(offsets[5]);
  object.userTitle = reader.readString(offsets[6]);
  object.username = reader.readString(offsets[7]);
  object.xpForCompletion = reader.readLong(offsets[8]);
  return object;
}

P _userProfileCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readObjectList<CompetencyXp>(
                offset,
                CompetencyXpSchema.deserialize,
                allOffsets,
                CompetencyXp(),
              ) ??
              [])
          as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userProfileCollectionGetId(UserProfileCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userProfileCollectionGetLinks(
  UserProfileCollection object,
) {
  return [];
}

void _userProfileCollectionAttach(
  IsarCollection<dynamic> col,
  Id id,
  UserProfileCollection object,
) {
  object.id = id;
}

extension UserProfileCollectionQueryWhereSort
    on QueryBuilder<UserProfileCollection, UserProfileCollection, QWhere> {
  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserProfileCollectionQueryWhere
    on
        QueryBuilder<
          UserProfileCollection,
          UserProfileCollection,
          QWhereClause
        > {
  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterWhereClause>
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

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterWhereClause>
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

extension UserProfileCollectionQueryFilter
    on
        QueryBuilder<
          UserProfileCollection,
          UserProfileCollection,
          QFilterCondition
        > {
  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  accountCreatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'accountCreated', value: value),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  accountCreatedGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'accountCreated',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  accountCreatedLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'accountCreated',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  accountCreatedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'accountCreated',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  competencyXpLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'competencyXp', length, true, length, true);
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  competencyXpIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'competencyXp', 0, true, 0, true);
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  competencyXpIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'competencyXp', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  competencyXpLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'competencyXp', 0, true, length, include);
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  competencyXpLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'competencyXp', length, include, 999999, true);
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  competencyXpLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'competencyXp',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  consecutiveDaysEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'consecutiveDays', value: value),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  consecutiveDaysGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'consecutiveDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  consecutiveDaysLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'consecutiveDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  consecutiveDaysBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'consecutiveDays',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  currentLevelEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'currentLevel', value: value),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  currentLevelGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'currentLevel',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  currentLevelLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'currentLevel',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  currentLevelBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'currentLevel',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
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
    UserProfileCollection,
    UserProfileCollection,
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
    UserProfileCollection,
    UserProfileCollection,
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
    UserProfileCollection,
    UserProfileCollection,
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
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  lastActiveSessionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastActiveSession', value: value),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  lastActiveSessionGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastActiveSession',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  lastActiveSessionLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastActiveSession',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  lastActiveSessionBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastActiveSession',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  totalXpEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalXp', value: value),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  totalXpGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalXp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  totalXpLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalXp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  totalXpBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalXp',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  userTitleEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'userTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  userTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  userTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  userTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userTitle',
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
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  userTitleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'userTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  userTitleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'userTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  userTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'userTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  userTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'userTitle',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  userTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userTitle', value: ''),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  userTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userTitle', value: ''),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  usernameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  usernameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  usernameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  usernameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'username',
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
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  usernameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  usernameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  usernameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  usernameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'username',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  usernameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'username', value: ''),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  usernameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'username', value: ''),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  xpForCompletionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'xpForCompletion', value: value),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  xpForCompletionGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'xpForCompletion',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  xpForCompletionLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'xpForCompletion',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  xpForCompletionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'xpForCompletion',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension UserProfileCollectionQueryObject
    on
        QueryBuilder<
          UserProfileCollection,
          UserProfileCollection,
          QFilterCondition
        > {
  QueryBuilder<
    UserProfileCollection,
    UserProfileCollection,
    QAfterFilterCondition
  >
  competencyXpElement(FilterQuery<CompetencyXp> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'competencyXp');
    });
  }
}

extension UserProfileCollectionQueryLinks
    on
        QueryBuilder<
          UserProfileCollection,
          UserProfileCollection,
          QFilterCondition
        > {}

extension UserProfileCollectionQuerySortBy
    on QueryBuilder<UserProfileCollection, UserProfileCollection, QSortBy> {
  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  sortByAccountCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountCreated', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  sortByAccountCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountCreated', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  sortByConsecutiveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consecutiveDays', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  sortByConsecutiveDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consecutiveDays', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  sortByCurrentLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLevel', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  sortByCurrentLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLevel', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  sortByLastActiveSession() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastActiveSession', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  sortByLastActiveSessionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastActiveSession', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  sortByTotalXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalXp', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  sortByTotalXpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalXp', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  sortByUserTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userTitle', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  sortByUserTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userTitle', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  sortByUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  sortByUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  sortByXpForCompletion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpForCompletion', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  sortByXpForCompletionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpForCompletion', Sort.desc);
    });
  }
}

extension UserProfileCollectionQuerySortThenBy
    on QueryBuilder<UserProfileCollection, UserProfileCollection, QSortThenBy> {
  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenByAccountCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountCreated', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenByAccountCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountCreated', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenByConsecutiveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consecutiveDays', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenByConsecutiveDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consecutiveDays', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenByCurrentLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLevel', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenByCurrentLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLevel', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenByLastActiveSession() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastActiveSession', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenByLastActiveSessionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastActiveSession', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenByTotalXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalXp', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenByTotalXpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalXp', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenByUserTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userTitle', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenByUserTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userTitle', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenByUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenByUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.desc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenByXpForCompletion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpForCompletion', Sort.asc);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QAfterSortBy>
  thenByXpForCompletionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpForCompletion', Sort.desc);
    });
  }
}

extension UserProfileCollectionQueryWhereDistinct
    on QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct> {
  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
  distinctByAccountCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountCreated');
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
  distinctByConsecutiveDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'consecutiveDays');
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
  distinctByCurrentLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentLevel');
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
  distinctByLastActiveSession() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastActiveSession');
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
  distinctByTotalXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalXp');
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
  distinctByUserTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
  distinctByUsername({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'username', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileCollection, UserProfileCollection, QDistinct>
  distinctByXpForCompletion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'xpForCompletion');
    });
  }
}

extension UserProfileCollectionQueryProperty
    on
        QueryBuilder<
          UserProfileCollection,
          UserProfileCollection,
          QQueryProperty
        > {
  QueryBuilder<UserProfileCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserProfileCollection, DateTime, QQueryOperations>
  accountCreatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountCreated');
    });
  }

  QueryBuilder<UserProfileCollection, List<CompetencyXp>, QQueryOperations>
  competencyXpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'competencyXp');
    });
  }

  QueryBuilder<UserProfileCollection, int, QQueryOperations>
  consecutiveDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'consecutiveDays');
    });
  }

  QueryBuilder<UserProfileCollection, int, QQueryOperations>
  currentLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentLevel');
    });
  }

  QueryBuilder<UserProfileCollection, DateTime, QQueryOperations>
  lastActiveSessionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastActiveSession');
    });
  }

  QueryBuilder<UserProfileCollection, int, QQueryOperations> totalXpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalXp');
    });
  }

  QueryBuilder<UserProfileCollection, String, QQueryOperations>
  userTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userTitle');
    });
  }

  QueryBuilder<UserProfileCollection, String, QQueryOperations>
  usernameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'username');
    });
  }

  QueryBuilder<UserProfileCollection, int, QQueryOperations>
  xpForCompletionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'xpForCompletion');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CompetencyXpSchema = Schema(
  name: r'CompetencyXp',
  id: 6247488830330879439,
  properties: {
    r'competencyId': PropertySchema(
      id: 0,
      name: r'competencyId',
      type: IsarType.string,
    ),
    r'totalXp': PropertySchema(id: 1, name: r'totalXp', type: IsarType.long),
  },

  estimateSize: _competencyXpEstimateSize,
  serialize: _competencyXpSerialize,
  deserialize: _competencyXpDeserialize,
  deserializeProp: _competencyXpDeserializeProp,
);

int _competencyXpEstimateSize(
  CompetencyXp object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.competencyId.length * 3;
  return bytesCount;
}

void _competencyXpSerialize(
  CompetencyXp object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.competencyId);
  writer.writeLong(offsets[1], object.totalXp);
}

CompetencyXp _competencyXpDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CompetencyXp();
  object.competencyId = reader.readString(offsets[0]);
  object.totalXp = reader.readLong(offsets[1]);
  return object;
}

P _competencyXpDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CompetencyXpQueryFilter
    on QueryBuilder<CompetencyXp, CompetencyXp, QFilterCondition> {
  QueryBuilder<CompetencyXp, CompetencyXp, QAfterFilterCondition>
  competencyIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'competencyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompetencyXp, CompetencyXp, QAfterFilterCondition>
  competencyIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'competencyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompetencyXp, CompetencyXp, QAfterFilterCondition>
  competencyIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'competencyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompetencyXp, CompetencyXp, QAfterFilterCondition>
  competencyIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'competencyId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompetencyXp, CompetencyXp, QAfterFilterCondition>
  competencyIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'competencyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompetencyXp, CompetencyXp, QAfterFilterCondition>
  competencyIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'competencyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompetencyXp, CompetencyXp, QAfterFilterCondition>
  competencyIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'competencyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompetencyXp, CompetencyXp, QAfterFilterCondition>
  competencyIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'competencyId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompetencyXp, CompetencyXp, QAfterFilterCondition>
  competencyIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'competencyId', value: ''),
      );
    });
  }

  QueryBuilder<CompetencyXp, CompetencyXp, QAfterFilterCondition>
  competencyIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'competencyId', value: ''),
      );
    });
  }

  QueryBuilder<CompetencyXp, CompetencyXp, QAfterFilterCondition>
  totalXpEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalXp', value: value),
      );
    });
  }

  QueryBuilder<CompetencyXp, CompetencyXp, QAfterFilterCondition>
  totalXpGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalXp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CompetencyXp, CompetencyXp, QAfterFilterCondition>
  totalXpLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalXp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CompetencyXp, CompetencyXp, QAfterFilterCondition>
  totalXpBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalXp',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension CompetencyXpQueryObject
    on QueryBuilder<CompetencyXp, CompetencyXp, QFilterCondition> {}
