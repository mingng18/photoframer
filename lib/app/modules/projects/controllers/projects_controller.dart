import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:photoframer/app/data/models/colors_combination.dart';
import 'package:photoframer/app/modules/preview_image/controllers/preview_image_controller.dart';
import 'package:photoframer/app/modules/projects/controllers/animated_dialog_controller.dart';

class ProjectsController extends GetxController {
  PreviewImageController previewImageController = Get.find();
  AnimatedDialogController animatedDialogController = Get.find();
  RxBool onFirstStart = false.obs;

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
