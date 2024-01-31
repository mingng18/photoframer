import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photoframer/app/data/models/post.dart';
import 'package:photoframer/app/data/models/project.dart';

class IsarService {
  late Future<Isar> isar;

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open([ProjectSchema, PostSchema], directory: dir.path);
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

  Future<List<Post>> getPosts() async {
    Isar db = await isar;
    final posts = await db.posts.where().findAll();
    return posts;
  }

  Future<Post> getPost(int id) async {
    Isar db = await isar;
    final post = await db.posts.get(id);
    return post!;
  }

  Future<Id> addPost(Post post) async {
    Isar db = await isar;
    return await db.writeTxn(() async {
      return await db.posts.put(post);
    });
  }

  Future<bool> deletePost(int id) async {
    Isar db = await isar;
    return await db.writeTxn(() async {
      return await db.posts.delete(id);
    });
  }
}
