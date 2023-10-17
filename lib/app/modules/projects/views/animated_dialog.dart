import 'package:flutter/material.dart';
import 'package:photoframer/app/modules/projects/controllers/animated_dialog_controller.dart';
import 'package:get/get.dart';

class AnimatedDialog extends GetView<AnimatedDialogController> {
  const AnimatedDialog({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: FadeTransition(
          opacity: controller.scaleAnimation,
          child: ScaleTransition(
            scale: controller.scaleAnimation,
            child: child,
          ),
        ),
      ),
    );
  }
}
