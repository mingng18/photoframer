import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photoframer/app/data/models/project.dart';

class IsarService {
  late Future<Isar> isar;

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open([ProjectSchema], directory: dir.path);
  }

  IsarService() {
    isar = openDB();
  }

  void closeDB() async {
    Isar db = await isar;
    db.close();
  }

  Future<List<Project>> getProjects() async {
    Isar db = await isar;
    final projects = await db.projects.where().findAll();
    // print("Project get successfully!");
    return projects;
  }

  Future<Project> getProject(int id) async {
    Isar db = await isar;
    final project = await db.projects.get(id);
    return project!;
  }

  Future<Id> addProject(Project project) async {
    Isar db = await isar;
    return await db.writeTxn(() async {
      return await db.projects.put(project);
    });
  }

  Future<bool> deleteProject(int id) async {
    Isar db = await isar;
    return await db.writeTxn(() async {
      return await db.projects.delete(id);
    });
  }
}
