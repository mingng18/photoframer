import 'package:isar/isar.dart';
import 'package:photoframer/app/data/models/photo.dart';
part 'photo_extended.g.dart';

@Embedded()
class PhotoExtended {
  int? id;
  Photo? photo;
  double? filledPercentage;

  PhotoExtended({
    this.photo,
    this.filledPercentage = 1,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = photo!.toMap();
    map['filledPercentage'] = filledPercentage;
    return map;
  }

  static PhotoExtended fromMap(Map<String, dynamic> map) {
    return PhotoExtended(
      photo: Photo.fromMap(map),
      filledPercentage: map['filledPercentage'] ?? 1,
    );
  }
}
