import 'package:get/get.dart';

import '../controllers/preview_image_controller.dart';

class PreviewImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreviewImageController>(
      () => PreviewImageController(),
    );
  }
}
