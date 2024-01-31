import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/no_crop_post_controller.dart';

class NoCropPostView extends GetView<NoCropPostController> {
  const NoCropPostView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NoCropPostView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NoCropPostView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
