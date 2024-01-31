import 'package:exif/exif.dart';
import 'package:geocoding/geocoding.dart';
import 'package:photoframer/app/data/models/photo.dart';
import 'package:photoframer/app/utils/maths.dart';

class CoordinatesConverter {
  CoordinatesConverter({required this.data});

  Map<String, IfdTag> data;

  static double convertDMSToDD(List<double> dms) {
    return dms[0] + (dms[1] / 60) + (dms[2] / 3600);
  }

  static List<double> convertStringToDMS(String input) {
    input = input.substring(1, input.length - 1);
    List<String> parts = input.split(',').map((e) => e.trim()).toList();

    if (parts.length != 3) {
      throw const FormatException(
          'Invalid input format. Expected "degrees, minutes, seconds".');
    }

    double degrees =
        double.parse(SimpleMaths.evalExpression(parts[0].toString()));
    double minutes =
        double.parse(SimpleMaths.evalExpression(parts[1].toString()));
    double seconds =
        double.parse(SimpleMaths.evalExpression(parts[2].toString()));

    // print('degrees: $degrees, minutes: $minutes, seconds: $seconds');

    return [degrees, minutes, seconds];
  }

  static double toLatitude(String gpsLatitude, String gpsLatitudeRef) {
    if (gpsLatitude == "null") return 0.0;

    double latitude = convertDMSToDD(convertStringToDMS(gpsLatitude));

    if (gpsLatitudeRef == 'S') {
      latitude = -latitude;
    }

    return latitude;
  }

  static double toLongitude(String gpsLongitude, String gpsLongitudeRef) {
    if (gpsLongitude == "null") return 0.0;

    double longitude = convertDMSToDD(convertStringToDMS(gpsLongitude));

    if (gpsLongitudeRef == 'W') {
      longitude = -longitude;
    }

    return longitude;
  }

  static double toAltitude(String gpsAltitude, String gpsAltitudeRef) {
    if (gpsAltitude == "null") return 0.0;

    double gpsAltitudeDouble = double.parse(gpsAltitude);
    if (gpsAltitude == "1") return -gpsAltitudeDouble;
    return gpsAltitudeDouble;
  }

  static Future<GPSData?> getGPSData(Map<String, IfdTag> data) async {
    double lat = toLatitude(data["GPS GPSLatitude"].toString(),
        data["GPS GPSLatitudeRef"].toString());
    double long = toLongitude(data["GPS GPSLongitude"].toString(),
        data["GPS GPSLongitudeRef"].toString());

    if (lat == 0.0 && long == 0.0) {
      return null;
    }
    return GPSData(
      gpsLatitude: lat,
      gpsLongitude: long,
      gpsAltitude: toAltitude(data["GPS GPSAltitude"].toString(),
          data["GPS GPSAltitudeRef"].toString()),
      address: await placemarkFromCoordinates(lat, long)
          .then((value) =>
              "${value[0].street}, ${value[0].administrativeArea}, ${value[0].country}")
          .onError((error, stackTrace) => ""),
    );
  }
}
