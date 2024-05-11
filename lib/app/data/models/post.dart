import 'package:isar/isar.dart';
import 'package:photoframer/app/data/models/photo.dart';
import 'package:photoframer/app/data/models/photo_extended.dart';

part 'post.g.dart';

@collection
class Post {
  Id id = Isar.autoIncrement;
  DateTime createdDate;
  DateTime updatedDate;
  double postAspectRatio;
  List<String>? tags;

  List<PhotoExtended> photos;

  Post({
    required this.createdDate,
    required this.updatedDate,
    this.postAspectRatio = 1,
    this.tags,
    required this.photos,
  });

  Map<String, dynamic> toMap() {
    return {
      'createdDate': createdDate.toUtc().toIso8601String(),
      'updatedDate': updatedDate.toUtc().toIso8601String(),
      'postAspectRatio': postAspectRatio,
      'tags': tags,
      'photos': photos.map((photo) => photo.toMap()).toList(),
    };
  }

  static Post fromMap(Map<String, dynamic> map) {
    return Post(
      createdDate: DateTime.parse(map['createdDate']),
      updatedDate: DateTime.parse(map['updatedDate']),
      postAspectRatio: map['postAspectRatio'],
      tags: map['tags'],
      photos: (map['photos'] as List<dynamic>)
          .map<PhotoExtended>((e) => PhotoExtended.fromMap(e))
          .toList(),
    );
  }
}
