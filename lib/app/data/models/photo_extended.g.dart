// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_extended.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PhotoExtendedSchema = Schema(
  name: r'PhotoExtended',
  id: 8973077559368507331,
  properties: {
    r'filledPercentage': PropertySchema(
      id: 0,
      name: r'filledPercentage',
      type: IsarType.double,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.long,
    ),
    r'photo': PropertySchema(
      id: 2,
      name: r'photo',
      type: IsarType.object,
      target: r'Photo',
    )
  },
  estimateSize: _photoExtendedEstimateSize,
  serialize: _photoExtendedSerialize,
  deserialize: _photoExtendedDeserialize,
  deserializeProp: _photoExtendedDeserializeProp,
);

int _photoExtendedEstimateSize(
  PhotoExtended object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.photo;
    if (value != null) {
      bytesCount +=
          3 + PhotoSchema.estimateSize(value, allOffsets[Photo]!, allOffsets);
    }
  }
  return bytesCount;
}

void _photoExtendedSerialize(
  PhotoExtended object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.filledPercentage);
  writer.writeLong(offsets[1], object.id);
  writer.writeObject<Photo>(
    offsets[2],
    allOffsets,
    PhotoSchema.serialize,
    object.photo,
  );
}

PhotoExtended _photoExtendedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PhotoExtended(
    filledPercentage: reader.readDoubleOrNull(offsets[0]),
    photo: reader.readObjectOrNull<Photo>(
      offsets[2],
      PhotoSchema.deserialize,
      allOffsets,
    ),
  );
  object.id = reader.readLongOrNull(offsets[1]);
  return object;
}

P _photoExtendedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<Photo>(
        offset,
        PhotoSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PhotoExtendedQueryFilter
    on QueryBuilder<PhotoExtended, PhotoExtended, QFilterCondition> {
  QueryBuilder<PhotoExtended, PhotoExtended, QAfterFilterCondition>
      filledPercentageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'filledPercentage',
      ));
    });
  }

  QueryBuilder<PhotoExtended, PhotoExtended, QAfterFilterCondition>
      filledPercentageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'filledPercentage',
      ));
    });
  }

  QueryBuilder<PhotoExtended, PhotoExtended, QAfterFilterCondition>
      filledPercentageEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filledPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PhotoExtended, PhotoExtended, QAfterFilterCondition>
      filledPercentageGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'filledPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PhotoExtended, PhotoExtended, QAfterFilterCondition>
      filledPercentageLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'filledPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PhotoExtended, PhotoExtended, QAfterFilterCondition>
      filledPercentageBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'filledPercentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PhotoExtended, PhotoExtended, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PhotoExtended, PhotoExtended, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PhotoExtended, PhotoExtended, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoExtended, PhotoExtended, QAfterFilterCondition>
      idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoExtended, PhotoExtended, QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoExtended, PhotoExtended, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PhotoExtended, PhotoExtended, QAfterFilterCondition>
      photoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photo',
      ));
    });
  }

  QueryBuilder<PhotoExtended, PhotoExtended, QAfterFilterCondition>
      photoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photo',
      ));
    });
  }
}

extension PhotoExtendedQueryObject
    on QueryBuilder<PhotoExtended, PhotoExtended, QFilterCondition> {
  QueryBuilder<PhotoExtended, PhotoExtended, QAfterFilterCondition> photo(
      FilterQuery<Photo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'photo');
    });
  }
}
