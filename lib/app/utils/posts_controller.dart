import 'package:get/get.dart';
import 'package:photoframer/app/data/models/post.dart';
import 'package:photoframer/app/global.dart';
import 'package:photoframer/app/utils/isar_service.dart';

class PostsListController extends GetxController {
  RxList<Post> posts = <Post>[].obs;
  final IsarService _db = GlobalService.to.db;

  static PostsListController get to => Get.find();

  Future<Post> getPost(int id) {
    return _db.getPost(id).then((value) => value);
  }

  void addPost(Post post) {
    _db.addPost(post);
    posts.insert(0, post);
    posts.refresh();
  }

  void deletePost(int id) {
    _db.deletePost(id);
    for (Post post in posts) {
      if (post.id == id) {
        posts.remove(post);
      }
    }
    posts.refresh();
  }

  void updatePost(Post post) {
    _db.addPost(post);
    for (Post dbPost in posts) {
      if (dbPost.id == post.id) {
        dbPost = post;
      }
    }
    posts.refresh();
  }

  @override
  void onInit() {
    super.onInit();
    _db.getPosts().then((value) {
      posts.value = value.reversed.toList();
    });
  }
}
