import 'package:get/get.dart';

import '../controllers/no_crop_post_controller.dart';

class NoCropPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoCropPostController>(
      () => NoCropPostController(),
    );
  }
}
