import 'package:exif/exif.dart';
import 'package:isar/isar.dart';
import 'package:photoframer/app/utils/maths.dart';

part 'photo.g.dart';

@embedded
class Photo {
  String? imageFilePath;
  int? imageWidth;
  int? imageLength;
  double? aspectRatio;
  String? imageMake;
  String? imageModel;
  String? imageSoftware;
  String? imageDateTime;
  String? exifExposureTime;
  String? exifFNumber;
  String? exifISOSpeedRatings;
  String? focalLength;
  String? lensModel;
  GPSData? location;

  Photo({
    this.imageFilePath,
    this.imageWidth,
    this.imageLength,
    this.aspectRatio,
    this.imageMake,
    this.imageModel,
    this.imageSoftware = "",
    this.imageDateTime,
    this.exifExposureTime,
    this.exifFNumber,
    this.exifISOSpeedRatings,
    this.focalLength,
    this.lensModel = "",
    this.location,
  });

  factory Photo.fromIfdTag(String imageFilePath, Map<String, IfdTag> data,
      int width, int length, GPSData? location) {
    return Photo(
        imageFilePath: imageFilePath,
        imageWidth: width,
        imageLength: length,
        // if it is bigger than 0.667, then it is horizontal
        aspectRatio: width / length >= 2 / 3 ? width / length : 2 / 3,
        imageMake: data["Image Make"].toString().toUpperCase(),
        imageModel: data["Image Model"].toString().toUpperCase(),
        imageSoftware: data["Image Software"].toString(),
        imageDateTime: data["EXIF DateTimeOriginal"].toString(),
        exifExposureTime: data["EXIF ExposureTime"].toString(),
        exifFNumber:
            SimpleMaths.evalExpression(data["EXIF FNumber"].toString()),
        exifISOSpeedRatings: data["EXIF ISOSpeedRatings"].toString(),
        focalLength: SimpleMaths.evalExpression(
            data["EXIF FocalLengthIn35mmFilm"].toString()),
        lensModel: data["EXIF LensModel"].toString(),
        location: location);
  }

  Map<String, dynamic> toMap() {
    return {
      'imageWidth': imageWidth,
      'imageLength': imageLength,
      'aspectRatio': aspectRatio,
      'imageMake': imageMake,
      'imageModel': imageModel,
      'imageSoftware': imageSoftware,
      'imageDateTime': imageDateTime,
      'exifExposureTime': exifExposureTime,
      'exifFNumber': exifFNumber,
      'exifISOSpeedRatings': exifISOSpeedRatings,
      'focalLength': focalLength,
      'lensModel': lensModel,
      'location': location?.toMap(),
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      imageFilePath: map['imageFile'],
      imageWidth: map['imageWidth'],
      imageLength: map['imageLength'],
      aspectRatio: map['aspectRatio'],
      imageMake: map['imageMake'],
      imageModel: map['imageModel'],
      imageSoftware: map['imageSoftware'],
      imageDateTime: map['imageDateTime'],
      exifExposureTime: map['exifExposureTime'],
      exifFNumber: map['exifFNumber'],
      exifISOSpeedRatings: map['exifISOSpeedRatings'],
      focalLength: map['focalLength'],
      lensModel: map['lensModel'],
      location: GPSData.fromMap(map['location']),
    );
  }

  @override
  String toString() {
    return 'Photo{'
        'imageWidth: $imageWidth, '
        'imageLength: $imageLength, '
        'imageMake: $imageMake, '
        'imageModel: $imageModel, '
        'imageSoftware: $imageSoftware, '
        'imageDateTime: $imageDateTime, '
        'exifExposureTime: $exifExposureTime, '
        'exifFNumber: $exifFNumber, '
        'exifISOSpeedRatings: $exifISOSpeedRatings, '
        'focalLength: $focalLength, '
        'lensModel: $lensModel, '
        'aspectRatio: $aspectRatio,'
        'location: $location'
        '}';
  }
}

@embedded
class GPSData {
  double? gpsLatitude; //55.32323
  double? gpsLongitude; //-88.92321
  double? gpsAltitude; //66
  String? address;

  GPSData({
    this.gpsLatitude,
    this.gpsLongitude,
    this.gpsAltitude,
    this.address = "",
  });

  Map<String, dynamic> toMap() {
    return {
      'gpsLatitude': gpsLatitude,
      'gpsLongitude': gpsLongitude,
      'gpsAltitude': gpsAltitude,
      'address': address,
    };
  }

  factory GPSData.fromMap(Map<String, dynamic> map) {
    return GPSData(
      gpsLatitude: map['gpsLatitude'],
      gpsLongitude: map['gpsLongitude'],
      gpsAltitude: map['gpsAltitude'],
      address: map['address'],
    );
  }

  @override
  String toString() {
    return '${gpsLatitude?.toStringAsFixed(6)}, ${gpsLongitude?.toStringAsFixed(6)}, ${gpsAltitude?.toStringAsFixed(6)} meters. Address: $address';
  }
}
