// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PhotoSchema = Schema(
  name: r'Photo',
  id: 7605685642742149252,
  properties: {
    r'aspectRatio': PropertySchema(
      id: 0,
      name: r'aspectRatio',
      type: IsarType.double,
    ),
    r'exifExposureTime': PropertySchema(
      id: 1,
      name: r'exifExposureTime',
      type: IsarType.string,
    ),
    r'exifFNumber': PropertySchema(
      id: 2,
      name: r'exifFNumber',
      type: IsarType.string,
    ),
    r'exifISOSpeedRatings': PropertySchema(
      id: 3,
      name: r'exifISOSpeedRatings',
      type: IsarType.long,
    ),
    r'focalLength': PropertySchema(
      id: 4,
      name: r'focalLength',
      type: IsarType.string,
    ),
    r'imageDateTime': PropertySchema(
      id: 5,
      name: r'imageDateTime',
      type: IsarType.string,
    ),
    r'imageFilePath': PropertySchema(
      id: 6,
      name: r'imageFilePath',
      type: IsarType.string,
    ),
    r'imageLength': PropertySchema(
      id: 7,
      name: r'imageLength',
      type: IsarType.long,
    ),
    r'imageMake': PropertySchema(
      id: 8,
      name: r'imageMake',
      type: IsarType.string,
    ),
    r'imageModel': PropertySchema(
      id: 9,
      name: r'imageModel',
      type: IsarType.string,
    ),
    r'imageSoftware': PropertySchema(
      id: 10,
      name: r'imageSoftware',
      type: IsarType.string,
    ),
    r'imageWidth': PropertySchema(
      id: 11,
      name: r'imageWidth',
      type: IsarType.long,
    ),
    r'lensModel': PropertySchema(
      id: 12,
      name: r'lensModel',
      type: IsarType.string,
    ),
    r'location': PropertySchema(
      id: 13,
      name: r'location',
      type: IsarType.object,
      target: r'GPSData',
    )
  },
  estimateSize: _photoEstimateSize,
  serialize: _photoSerialize,
  deserialize: _photoDeserialize,
  deserializeProp: _photoDeserializeProp,
);

int _photoEstimateSize(
  Photo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.exifExposureTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.exifFNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.focalLength;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageDateTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageFilePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageMake;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageModel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageSoftware;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lensModel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.location;
    if (value != null) {
      bytesCount += 3 +
          GPSDataSchema.estimateSize(value, allOffsets[GPSData]!, allOffsets);
    }
  }
  return bytesCount;
}

void _photoSerialize(
  Photo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.aspectRatio);
  writer.writeString(offsets[1], object.exifExposureTime);
  writer.writeString(offsets[2], object.exifFNumber);
  writer.writeLong(offsets[3], object.exifISOSpeedRatings);
  writer.writeString(offsets[4], object.focalLength);
  writer.writeString(offsets[5], object.imageDateTime);
  writer.writeString(offsets[6], object.imageFilePath);
  writer.writeLong(offsets[7], object.imageLength);
  writer.writeString(offsets[8], object.imageMake);
  writer.writeString(offsets[9], object.imageModel);
  writer.writeString(offsets[10], object.imageSoftware);
  writer.writeLong(offsets[11], object.imageWidth);
  writer.writeString(offsets[12], object.lensModel);
  writer.writeObject<GPSData>(
    offsets[13],
    allOffsets,
    GPSDataSchema.serialize,
    object.location,
  );
}

Photo _photoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Photo(
    aspectRatio: reader.readDoubleOrNull(offsets[0]),
    exifExposureTime: reader.readStringOrNull(offsets[1]),
    exifFNumber: reader.readStringOrNull(offsets[2]),
    exifISOSpeedRatings: reader.readLongOrNull(offsets[3]),
    focalLength: reader.readStringOrNull(offsets[4]),
    imageDateTime: reader.readStringOrNull(offsets[5]),
    imageFilePath: reader.readStringOrNull(offsets[6]),
    imageLength: reader.readLongOrNull(offsets[7]),
    imageMake: reader.readStringOrNull(offsets[8]),
    imageModel: reader.readStringOrNull(offsets[9]),
    imageSoftware: reader.readStringOrNull(offsets[10]),
    imageWidth: reader.readLongOrNull(offsets[11]),
    lensModel: reader.readStringOrNull(offsets[12]),
    location: reader.readObjectOrNull<GPSData>(
      offsets[13],
      GPSDataSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _photoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readObjectOrNull<GPSData>(
        offset,
        GPSDataSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PhotoQueryFilter on QueryBuilder<Photo, Photo, QFilterCondition> {
  QueryBuilder<Photo, Photo, QAfterFilterCondition> aspectRatioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'aspectRatio',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> aspectRatioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'aspectRatio',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> aspectRatioEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aspectRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> aspectRatioGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aspectRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> aspectRatioLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aspectRatio',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> aspectRatioBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aspectRatio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifExposureTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exifExposureTime',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition>
      exifExposureTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exifExposureTime',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifExposureTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exifExposureTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifExposureTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exifExposureTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifExposureTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exifExposureTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifExposureTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exifExposureTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifExposureTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exifExposureTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifExposureTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exifExposureTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifExposureTimeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exifExposureTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifExposureTimeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exifExposureTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifExposureTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exifExposureTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition>
      exifExposureTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exifExposureTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifFNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exifFNumber',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifFNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exifFNumber',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifFNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exifFNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifFNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exifFNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifFNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exifFNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifFNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exifFNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifFNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exifFNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifFNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exifFNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifFNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exifFNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifFNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exifFNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifFNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exifFNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifFNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exifFNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition>
      exifISOSpeedRatingsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exifISOSpeedRatings',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition>
      exifISOSpeedRatingsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exifISOSpeedRatings',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifISOSpeedRatingsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exifISOSpeedRatings',
        value: value,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition>
      exifISOSpeedRatingsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exifISOSpeedRatings',
        value: value,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifISOSpeedRatingsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exifISOSpeedRatings',
        value: value,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> exifISOSpeedRatingsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exifISOSpeedRatings',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> focalLengthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'focalLength',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> focalLengthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'focalLength',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> focalLengthEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'focalLength',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> focalLengthGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'focalLength',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> focalLengthLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'focalLength',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> focalLengthBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'focalLength',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> focalLengthStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'focalLength',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> focalLengthEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'focalLength',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> focalLengthContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'focalLength',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> focalLengthMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'focalLength',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> focalLengthIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'focalLength',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> focalLengthIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'focalLength',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageDateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageDateTime',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageDateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageDateTime',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageDateTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageDateTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageDateTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageDateTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageDateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageDateTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageDateTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageDateTimeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageDateTimeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageDateTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageDateTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageDateTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageDateTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageDateTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageFilePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageFilePath',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageFilePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageFilePath',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageFilePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageFilePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageFilePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageFilePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageFilePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageFilePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageFilePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageFilePathContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageFilePathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageFilePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageFilePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageFilePath',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageFilePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageFilePath',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageLengthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageLength',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageLengthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageLength',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageLengthEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageLength',
        value: value,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageLengthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageLength',
        value: value,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageLengthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageLength',
        value: value,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageLengthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageLength',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageMakeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageMake',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageMakeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageMake',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageMakeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageMake',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageMakeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageMake',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageMakeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageMake',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageMakeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageMake',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageMakeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageMake',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageMakeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageMake',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageMakeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageMake',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageMakeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageMake',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageMakeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageMake',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageMakeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageMake',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageModelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageModel',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageModelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageModel',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageModelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageModelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageModelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageModelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageModel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageModelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageModelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageModelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageModelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageModel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageModel',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageModel',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageSoftwareIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageSoftware',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageSoftwareIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageSoftware',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageSoftwareEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageSoftware',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageSoftwareGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageSoftware',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageSoftwareLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageSoftware',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageSoftwareBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageSoftware',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageSoftwareStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageSoftware',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageSoftwareEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageSoftware',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageSoftwareContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageSoftware',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageSoftwareMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageSoftware',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageSoftwareIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageSoftware',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageSoftwareIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageSoftware',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageWidthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageWidth',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageWidthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageWidth',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageWidthEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageWidth',
        value: value,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageWidthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageWidth',
        value: value,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageWidthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageWidth',
        value: value,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> imageWidthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageWidth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> lensModelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lensModel',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> lensModelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lensModel',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> lensModelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lensModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> lensModelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lensModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> lensModelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lensModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> lensModelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lensModel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> lensModelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lensModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> lensModelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lensModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> lensModelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lensModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> lensModelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lensModel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> lensModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lensModel',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> lensModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lensModel',
        value: '',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<Photo, Photo, QAfterFilterCondition> locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'location',
      ));
    });
  }
}

extension PhotoQueryObject on QueryBuilder<Photo, Photo, QFilterCondition> {
  QueryBuilder<Photo, Photo, QAfterFilterCondition> location(
      FilterQuery<GPSData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'location');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const GPSDataSchema = Schema(
  name: r'GPSData',
  id: 3744841600689921698,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'gpsAltitude': PropertySchema(
      id: 1,
      name: r'gpsAltitude',
      type: IsarType.double,
    ),
    r'gpsLatitude': PropertySchema(
      id: 2,
      name: r'gpsLatitude',
      type: IsarType.double,
    ),
    r'gpsLongitude': PropertySchema(
      id: 3,
      name: r'gpsLongitude',
      type: IsarType.double,
    )
  },
  estimateSize: _gPSDataEstimateSize,
  serialize: _gPSDataSerialize,
  deserialize: _gPSDataDeserialize,
  deserializeProp: _gPSDataDeserializeProp,
);

int _gPSDataEstimateSize(
  GPSData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.address;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _gPSDataSerialize(
  GPSData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeDouble(offsets[1], object.gpsAltitude);
  writer.writeDouble(offsets[2], object.gpsLatitude);
  writer.writeDouble(offsets[3], object.gpsLongitude);
}

GPSData _gPSDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GPSData(
    address: reader.readStringOrNull(offsets[0]),
    gpsAltitude: reader.readDoubleOrNull(offsets[1]),
    gpsLatitude: reader.readDoubleOrNull(offsets[2]),
    gpsLongitude: reader.readDoubleOrNull(offsets[3]),
  );
  return object;
}

P _gPSDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension GPSDataQueryFilter
    on QueryBuilder<GPSData, GPSData, QFilterCondition> {
  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> addressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> addressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> addressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> addressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> addressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> addressContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> addressMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> gpsAltitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gpsAltitude',
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> gpsAltitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gpsAltitude',
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> gpsAltitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gpsAltitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> gpsAltitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gpsAltitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> gpsAltitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gpsAltitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> gpsAltitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gpsAltitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> gpsLatitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gpsLatitude',
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> gpsLatitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gpsLatitude',
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> gpsLatitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gpsLatitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> gpsLatitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gpsLatitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> gpsLatitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gpsLatitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> gpsLatitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gpsLatitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> gpsLongitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gpsLongitude',
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition>
      gpsLongitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gpsLongitude',
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> gpsLongitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gpsLongitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> gpsLongitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gpsLongitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> gpsLongitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gpsLongitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GPSData, GPSData, QAfterFilterCondition> gpsLongitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gpsLongitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension GPSDataQueryObject
    on QueryBuilder<GPSData, GPSData, QFilterCondition> {}
