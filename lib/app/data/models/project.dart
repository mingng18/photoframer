import 'package:photoframer/app/data/models/photo.dart';
import 'package:isar/isar.dart';
part 'project.g.dart';

@collection
class Project {
  Id id = Isar.autoIncrement;
  String? title;
  String? content;
  DateTime createdDate;
  DateTime updatedDate;
  List<String>? tags;
  Photo photo;

  Project({
    this.title,
    this.content,
    required this.createdDate,
    required this.updatedDate,
    this.tags,
    required this.photo,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'createdDate': createdDate.millisecondsSinceEpoch,
      'updatedDate': updatedDate.millisecondsSinceEpoch,
      'tags': tags,
      'photo': photo.toMap(),
    };
  }

  static Project fromMap(Map<String, dynamic> map) {
    return Project(
      title: map['title'],
      content: map['content'],
      createdDate: DateTime.fromMillisecondsSinceEpoch(map['createdDate']),
      updatedDate: DateTime.fromMillisecondsSinceEpoch(map['updatedDate']),
      tags: map['tags'],
      photo: Photo.fromMap(map['photo']),
    );
  }
}
