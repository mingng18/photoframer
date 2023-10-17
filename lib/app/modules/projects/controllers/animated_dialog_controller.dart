import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedDialogController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacityAnimation;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    scaleAnimation =
        CurvedAnimation(parent: animationController, curve: const Cubic(0.05, 0.7, 0.1, 1.0));
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.6).animate(
        CurvedAnimation(
            parent: animationController, curve: const Cubic(0.05, 0.7, 0.1, 1.0)));
            
    animationController.reverseDuration = const Duration(milliseconds: 100);
  }
}
