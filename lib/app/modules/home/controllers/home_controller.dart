import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photoframer/app/modules/preview_image/controllers/preview_image_controller.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var tabIndex = 0.obs;

  late final AnimationController animationController;
  late final Animation<double> expandAnimation;
  final PreviewImageController previewImageController =
      Get.find<PreviewImageController>();

  RxBool isFABOpened = false.obs;

  late List<ActionButton> actionButtons;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void toggleFAB() {
    isFABOpened.value = !isFABOpened.value;
    if (isFABOpened.value) {
      animationController.forward();
      print("forward");
    } else {
      animationController.reverse();
      print("reverse");
    }
  }

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      value: isFABOpened.value ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    expandAnimation = CurvedAnimation(
      // curve: Curves.fastOutSlowIn,
      curve: Curves.easeInOutCubicEmphasized,
      reverseCurve: Curves.easeOutQuad,
      parent: animationController,
    );

    actionButtons = [
      ActionButton(
          title: "Create New", icon: Icons.add, onPressed: () => toggleFAB()),
      ActionButton(
          title: "Photo",
          icon: Icons.photo,
          onPressed: () {
            // Get.back();
            previewImageController.pickImageFromGallery();
            isFABOpened.value = false;
          }),
      ActionButton(
          title: "Story", icon: Icons.square_rounded, onPressed: () {}),
      // ActionButton(title: "Video", icon: Icons.video_call, onPressed: () {}),
    ];
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}

class ActionButton {
  final String title;
  final IconData icon;
  final Function onPressed;

  ActionButton({
    required this.title,
    required this.icon,
    required this.onPressed,
  });
}
