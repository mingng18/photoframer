import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:photoframer/app/data/models/colors_combination.dart';
import 'package:photoframer/app/modules/no_crop_post/controllers/no_crop_post_controller.dart';
import 'package:photoframer/app/modules/preview_image/controllers/preview_image_controller.dart';
import 'package:photoframer/app/modules/projects/controllers/animated_dialog_controller.dart';

class ProjectsController extends GetxController
    with GetTickerProviderStateMixin {
  PreviewImageController previewImageController = Get.find();
  NoCropPostController noCropPostController = Get.find();
  AnimatedDialogController animatedDialogController = Get.find();
  late TabController tabController;
  RxBool onFirstStart = false.obs;

  late AnimationController animationController;
  late Animation rightAnimation;
  late Animation leftAnimation;

  ColorCombination getRandomColor() {
    int randomInt = Random().nextInt(3);
    switch (randomInt) {
      case 0:
        return ColorCombination(
            background: Theme.of(Get.context!).colorScheme.primaryContainer,
            title: Theme.of(Get.context!).colorScheme.onPrimaryContainer);
      case 1:
        return ColorCombination(
            background: Theme.of(Get.context!).colorScheme.secondaryContainer,
            title: Theme.of(Get.context!).colorScheme.onSecondaryContainer);
      case 2:
        return ColorCombination(
            background: Theme.of(Get.context!).colorScheme.tertiaryContainer,
            title: Theme.of(Get.context!).colorScheme.onTertiaryContainer);
      default:
        return ColorCombination(
            background: Theme.of(Get.context!).colorScheme.surface,
            title: Theme.of(Get.context!).colorScheme.onSurface);
    }
  }

  String formatDateTime(DateTime date) {
    final formattedDate = DateFormat('dd MMM h:mma').format(date);
    return formattedDate;
  }

  void onScreenStarted() {
    onFirstStart.value = true;
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);

    animationController = AnimationController(
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 1000),
        vsync: this);

    final CurvedAnimation curve = CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.easeOut);
        
    rightAnimation = Tween(begin: 0, end: 5.0).animate(curve);
    leftAnimation = Tween(begin: 0, end: -5.0).animate(curve);

    rightAnimation.addStatusListener(listener);
    leftAnimation.addStatusListener(listener);

    animationController.forward();
  }

  void listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      animationController.forward();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
