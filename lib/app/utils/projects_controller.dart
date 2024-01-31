import 'package:get/get.dart';
import 'package:photoframer/app/data/models/project.dart';
import 'package:photoframer/app/global.dart';
import 'package:photoframer/app/utils/isar_service.dart';

class ProjectListController extends GetxController {
  RxList<Project> projects = <Project>[].obs;
  final IsarService _db = GlobalService.to.db;

  static ProjectListController get to => Get.find();

  Future<Project> getProject(int id) {
    return _db.getProject(id).then((value) => value);
  }

  void addProject(Project project) {
    _db.addProject(project);
    projects.insert(0, project);
    projects.refresh();
  }

  void deleteProject(String id) {
    _db.deleteProject(int.parse(id));
    for (Project project in projects) {
      if (project.id == int.parse(id)) {
        projects.remove(project);
      }
    }
    projects.refresh();
  }

  void updateProject(Project project) {
    _db.addProject(project);
    for (Project dbProject in projects) {
      if (dbProject.id == project.id) {
        dbProject = project;
      }
    }
    projects.refresh();
  }

  @override
  void onInit() {
    super.onInit();
    _db.getProjects().then((value) {
      projects.value = value.reversed.toList();
    });
  }
}
